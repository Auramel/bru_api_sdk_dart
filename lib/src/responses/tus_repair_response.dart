// Package imports:
import 'package:dart_qjson/dart_qjson.dart';

class TusRepairResponse {
  final String token;
  final int requestCount;
  final String appPsw;

  factory TusRepairResponse.fromJson(final JsonObject json) {
    return TusRepairResponse(
      token: json.get('token')!.toText()!,
      requestCount: json.get('request_count')!.toInt()!,
      appPsw: json.get('app_psw')!.toText()!,
    );
  }
  
  TusRepairResponse({
    required this.token,
    required this.requestCount,
    required this.appPsw,
  });
}
