// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import 'package:bru_api_client/src/clients/bid_client.dart';
import 'package:bru_api_client/src/clients/tus_rest_client.dart';
import 'package:bru_api_client/src/responses/bid_accounts_response.dart';
import 'package:bru_api_client/src/responses/bid_me_response.dart';
import 'package:bru_api_client/src/responses/bid_token_response.dart';

class BruApiClient {
  final String enterUrl;
  final String bidUrl;
  final Uri baseUrl;

  final String clientSecret;
  final String clientId;
  final String scope;

  final Dio dio;

  BidMeResponse? _me;
  late final TusRestClient rest;
  late final BidClient auth;

  factory BruApiClient.init({
    required final String clientSecret,
    required final String clientId,
    required final String enterUrl,
    required final String bidUrl,
    required final String scope,
    required final Uri baseUrl,
    final List<Interceptor> interceptors = const [],
    Dio? dio,
  }) {
    dio ??= Dio(BaseOptions(validateStatus: (final int? status) => true));
    dio.interceptors.addAll(interceptors);

    return BruApiClient._internal(
      clientSecret: clientSecret,
      clientId: clientId,
      enterUrl: enterUrl,
      scope: scope,
      bidUrl: bidUrl,
      baseUrl: baseUrl,
      dio: dio,
    );
  }

  Future<void> login({
    required final String username,
    required final String password,
  }) async {
    final BidTokenResponse bidToken = await auth.loginByPassword(
      username: username,
      password: password,
    );

    rest.bidToken = bidToken;
    final BidMeResponse meResponse = await auth.me();
    _me = meResponse;

    final BidAccountsResponse accountsResponse = await rest.accounts(meResponse.id!);
    rest.account = accountsResponse.accounts.first;

    await rest.auth();
  }

  BruApiClient._internal({
    required this.clientSecret,
    required this.clientId,
    required this.enterUrl,
    required this.baseUrl,
    required this.bidUrl,
    required this.scope,
    required this.dio,
  }) {
    auth = BidClient(
      clientSecret: clientSecret,
      clientId: clientId,
      scope: scope,
      url: bidUrl,
      dio: dio,
    );

    rest = TusRestClient.create(
      enterUrl: enterUrl,
      baseUrl: baseUrl,
      dio: dio
    );
  }

  BidMeResponse? get me => _me;
}
