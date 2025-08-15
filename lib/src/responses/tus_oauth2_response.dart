// Package imports:
import 'package:dart_qjson/dart_qjson.dart';

class TusOauth2Response {
  final String? appId;
  final String? secret;

  const TusOauth2Response({
    required this.appId,
    required this.secret,
  });

  factory TusOauth2Response.fromJson(final JsonObject json) {
    return TusOauth2Response(
      appId: json.get('app_id')?.toText(),
      secret: json.get('secret')?.toText(),
    );
  }
}
