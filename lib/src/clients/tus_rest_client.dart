// Dart imports:
import 'dart:collection';
import 'dart:io';

// Package imports:
import 'package:dart_qjson/dart_qjson.dart';
import 'package:dio/dio.dart';
import 'package:simplified_uri/simplified_uri.dart';

// Project imports:
import 'package:bru_api_client/src/converters/md5_converter.dart';
import 'package:bru_api_client/src/data/dto/account.dart';
import 'package:bru_api_client/src/exceptions/null_account_exception.dart';
import 'package:bru_api_client/src/exceptions/null_bid_token_exception.dart';
import 'package:bru_api_client/src/exceptions/response_exception.dart';
import 'package:bru_api_client/src/responses/bid_accounts_response.dart';
import 'package:bru_api_client/src/responses/bid_token_response.dart';
import 'package:bru_api_client/src/responses/tus_oauth2_response.dart';
import 'package:bru_api_client/src/responses/tus_repair_response.dart';

class TusRestClient {
  final Dio dio;
  
  BidTokenResponse? bidToken;
  String? secret;
  String? appId;
  String? token;

  Account? account;
  String enterUrl;
  Uri baseUrl;
  int? port;

  final int maxRetries;

  TusRestClient({
    required this.enterUrl,
    required this.baseUrl,
    required this.dio,
    this.maxRetries = 3,
  });

  factory TusRestClient.create({
    required final String enterUrl,
    required final Uri baseUrl,
    final Dio? dio
  }) {
    return TusRestClient(
      enterUrl: enterUrl,
      baseUrl: baseUrl,
      dio: dio ?? Dio(),
    );
  }

  String generateUrlWithParams({
    required final String url,
    Map<String, dynamic>? params,
  }) {
    params ??= {};
    params = generateBodyParams(params);

    final Uri parsedUri = Uri.parse(url);
    final Uri uri = Uri.https(('${parsedUri.host}:${parsedUri.port}'), parsedUri.path, params);

    return uri.toString();
  }

  Map<String, dynamic> generateBodyParams(final Map<String, dynamic> params) {
    params['app_id'] = appId;
    final String paramsString = generateQueryString(SplayTreeMap.from(params));
    params['app_psw'] = Md5Converter.encodeString(token! + secret! + paramsString).toString();
    return SplayTreeMap.from(params);
  }

  String generateQueryString(final Map<String, dynamic> object) {
    return SimplifiedUri.uri('google.com', object).query;
  }

  Future<Response> query(String query) async {
    return await retryOnUnauthorized(() async {
      final Map<String, dynamic> params = {
        'app_id': appId,
        'app_psw': Md5Converter.encodeString(appId! + secret! + token!).toString(),
      };

      query = JsonObject({
        'query': query,
        'variables': {}
      }).toJsonString;

      return await dio.post(
        '$_url/api/rest/graphql.json',
        queryParameters: params,
        data: query,
      );
    });
  }

  Future<Response> search(final String model, final String query) async {
    return await retryOnUnauthorized(() async {
      final String url = generateUrlWithParams(
        url: '$_url/api/rest/$model.json',
        params: {
          'text': query
        }
      );

      return await dio.get(url);
    });
  }

  Future<Response> retryOnUnauthorized(final Future<dynamic> Function() request) async {
    int attempt = 0;

    while (true) {
      try {
        final Response response = await request();
        return response;
      } on DioException catch (e) {
        if (
          e.response?.statusCode == HttpStatus.unauthorized
          && attempt < maxRetries
        ) {
          attempt++;
          await repair();
          continue;
        }

        rethrow;
      }
    }
  }

  Future<Response> get(final String model, final Map<String, dynamic> params) async {
    return await retryOnUnauthorized(() async {
      final Map<String, dynamic> params_ = generateBodyParams(params);

      return await dio.get('$_url/api/rest/$model.json', queryParameters: params_);
    });
  }

  Future<Response> post(final String model, final Map<String, dynamic> body) async {
    return await retryOnUnauthorized(() async {
      final Map<String, dynamic> params = generateBodyParams(body);

      return await dio.post('$_url/api/rest/$model.json', data: body, queryParameters: params);
    });
  }

  Future<Response> put(final String model, final Map<String, dynamic> body) async {
    return await retryOnUnauthorized(() async {
      final Map<String, dynamic> params = generateBodyParams(body);

      return await dio.put('$_url/api/rest/$model.json', data: body, queryParameters: params);
    });
  }

  Future<Response> delete(final String model, final int id) async {
    return await retryOnUnauthorized(() async {
      final Map<String, dynamic> params = {'id': id};
      final Map<String, dynamic> queryParams = generateBodyParams(params);

      return await dio.delete('$_url/api/rest/$model.json', queryParameters: queryParams);
    });
  }

  Future<BidAccountsResponse> accounts(final String id) async {
    final Response response = await retryOnUnauthorized(() async {
      final Map<String, dynamic> headers = {
        ..._authHeaders,
        'id': id,
      };

      return await dio.get(
        '$enterUrl/api/mobile/authorize/$id',
        options: Options(headers: headers)
      );
    });

    return BidAccountsResponse.fromJson(JsonList(response.data));
  }

  Future<TusOauth2Response> oauth2() async {
    final Response response = await retryOnUnauthorized(() async {
      return await dio.post(
        '$_url/api/rest/create_app_with_oauth2.json',
        options: Options(headers: _authHeaders),
        data: {
          'system_app': true
        },
      );
    });

    return TusOauth2Response.fromJson(JsonObject(response.data)); 
  }

  Future<void> auth() async {
    final TusOauth2Response oauth2response = await oauth2();
    secret = oauth2response.secret;
    appId = oauth2response.appId;

    final TusRepairResponse repairResponse = await repair();
    token = repairResponse.token;
  }

  Future<TusRepairResponse> repair() async {
    final Map<String, dynamic> params = {
      'app_id': appId.toString(),
      'app_psw': Md5Converter.encodeString('${secret}app_id=$appId').toString()
    };
    
    final Response response = await dio.post('$_url/api/rest/repair.json', queryParameters: params);

    if (response.statusCode != HttpStatus.ok) {
      throw Exception(response.data.toString());
    }

    try {
      return TusRepairResponse.fromJson(JsonObject(response.data));
    } on Exception {
      throw ResponseException(response);
    }
  }

  Map<String, dynamic> get _authHeaders {
    if (bidToken == null) {
      throw NullBidTokenException();
    }

    return {
      'Authorization': '${bidToken!.tokenType} ${bidToken!.accessToken}',
      'content-type': 'application/x-www-form-urlencoded',
    };
  }

  String get _url {
    if (account == null) {
      throw NullAccountException();
    }

    final String host = '${account?.companyCode}.${baseUrl.host}';
    final Uri uri = Uri(
      scheme: baseUrl.scheme,
      host: host,
      port: (port == 0)
        ? null
        : port,
    );
    return uri.toString();
  }
}
