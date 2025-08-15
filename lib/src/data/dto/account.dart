// Package imports:
import 'package:dart_qjson/dart_qjson.dart';

class Account {
  final String? companyCode;
  final String? name;
  final DateTime? logitAt;
  final String? bid;
  final String? token;

  factory Account.fromJson(final JsonObject? json) {
    return Account(
      companyCode: json?.get('company_code')?.toText(),
      name: json?.get('company_name')?.toText(),
      logitAt: json?.get('login_at')?.toLocalDateTime(),
      bid: json?.get('bid')?.toText(),
      token: json?.get('token')?.toText(),
    );
  }

  Account({
    required this.companyCode,
    required this.name,
    required this.logitAt,
    required this.token,
    required this.bid,
  });
}
