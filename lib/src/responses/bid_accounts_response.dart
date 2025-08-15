// Package imports:
import 'package:dart_qjson/dart_qjson.dart';

// Project imports:
import 'package:bru_api_sdk_dart/src/data/dto/account.dart';

class BidAccountsResponse {
  final List<Account> accounts;

  BidAccountsResponse(this.accounts);

  factory BidAccountsResponse.fromJson(final JsonList json) {
    return BidAccountsResponse(json.data.map((final dynamic json) => Account.fromJson(JsonObject(json))).toList());
  }
}
