// ignore_for_file: public_member_api_docs, sort_constructors_first

// Package imports:
import 'package:dart_qjson/dart_qjson.dart';

class BidTokenResponse {
  final String tokenType;
  
  final int expiresIn;
  
  final String accessToken;
  final String refreshToken;
  final String? sessionToken;
  
  final String appSession;
  final String? sessionId;
  final String userId;
  
  final dynamic accounts;

  BidTokenResponse({
    required this.tokenType,
    required this.expiresIn,
    required this.accessToken,
    required this.refreshToken,
    required this.sessionToken,
    required this.appSession,
    required this.sessionId,
    required this.userId,
    required this.accounts
  });

  factory BidTokenResponse.fromJson(final JsonObject? json) {
    return BidTokenResponse(
      tokenType: json!.get('token_type')!.toText()!,
      expiresIn: json.get('expires_in')!.toInt()!,
      accessToken: json.get('access_token')!.toText()!,
      refreshToken: json.get('refresh_token')!.toText()!,
      sessionToken: json.get('session_token')?.toText()!,
      appSession: json.get('app_session')!.toText()!,
      sessionId: json.get('session_id')?.toText()!,
      userId: json.get('user_id')!.toText()!,
      accounts: [],
    );
  }
}
