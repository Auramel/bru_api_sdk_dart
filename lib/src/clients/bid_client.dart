// Package imports:
import 'package:dart_qjson/dart_qjson.dart';
import 'package:dio/dio.dart';

// Project imports:
import 'package:bru_api_sdk_dart/src/exceptions/null_token_exception.dart';
import 'package:bru_api_sdk_dart/src/responses/bid_me_response.dart';
import 'package:bru_api_sdk_dart/src/responses/bid_token_response.dart';

class BidClient {
  final String clientSecret;
  final String clientId;
  final String scope;
  final String url;
  final Dio dio;

  BidTokenResponse? token;

  BidClient({
    required this.clientSecret,
    required this.clientId,
    required this.dio,
    required this.url,
    required this.scope,
  });

  Future<BidTokenResponse> loginByPassword({
    required final String username,
    required final String password,
  }) async {
    return await _token({
      'grant_type': 'password',
      'username': username,
      'password': password
    });
  }

  Future<BidTokenResponse> refresh() async {
    if (token == null) {
      throw NullTokenException();
    }

    return await _token({
      'grant_type': 'refresh_token',
      'refresh_token': token?.refreshToken,
    });
  }

  Future<BidTokenResponse> _token(final Map<String, dynamic> credentials) async {
    credentials.addAll({
      'client_id': clientId,
      'client_secret': clientSecret,
    });

    final Response response = await dio.post('$url/token', data: credentials);
    final BidTokenResponse tokenResponse = BidTokenResponse.fromJson(JsonObject(response.data));
    token = tokenResponse;
    return tokenResponse;
  }

  Future<BidMeResponse> me() async {
    final Response response = await dio.get('$url/api/users/me', options: Options(headers: headers));
    return BidMeResponse.fromJson(JsonObject(response.data));
  }

  Map<String, dynamic> get headers {
    if (token == null) {
      throw NullTokenException();
    }

    return {
      'Authorization': '${token?.tokenType} ${token?.accessToken}',
    };
  }
}
