// Package imports:
import 'package:dart_qjson/dart_qjson.dart';

// Project imports:
import 'package:bru_api_sdk_dart/src/data/dto/photos.dart';

class BidMeResponse {
  final String? id;
  final String? email;
  final String? phone;
  final String? firstName;
  final String? lastName;
  final String? middleName;
  final DateTime? birthdate;
  final int? sex;
  final String? timeZone;
  final String? ref;
  final Photos? photos;
  final bool? enabled;
  final bool? deleted;
  final DateTime? deletedAt;
  final String? telegramUsername;
  final bool? telegramConnected;
  final bool? tfaEnabled;
  final String? partnerId;
  final List<dynamic>? crmPartnerIds;
  final bool? emailConfirmed;
  final bool? phoneConfirmed;

  BidMeResponse({
    required this.id,
    required this.email,
    required this.phone,
    required this.firstName,
    required this.lastName,
    required this.birthdate,
    required this.sex,
    required this.timeZone,
    required this.photos,
    required this.enabled,
    required this.deleted,
    required this.telegramConnected,
    required this.tfaEnabled,
    required this.partnerId,
    required this.crmPartnerIds,
    required this.emailConfirmed,
    required this.phoneConfirmed,
    required this.ref,
    required this.telegramUsername,
    required this.deletedAt,
    required this.middleName,
  });

  factory BidMeResponse.fromJson(final JsonObject json) {
    final JsonObject? data = json.getObject('data'); 

    return BidMeResponse(
      id: data?.get('id')?.toText(),
      email: data?.get('email')?.toText(),
      phone: data?.get('phone')?.toText(),
      firstName: data?.get('first_name')?.toText(),
      lastName: data?.get('last_name')?.toText(),
      middleName: data?.get('middle_name')?.toText(),
      birthdate: data?.get('birthdate')?.toDateTime(),
      sex: data?.get('sex')?.toInt(),
      timeZone: data?.get('time_zone')?.toText(),
      ref: data?.get('ref')?.toText(),
      photos: Photos.fromJson(json.getObject('photos') ?? JsonObject.empty()),
      enabled: data?.get('enabled')?.toBoolean(),
      deleted: data?.get('deleted')?.toBoolean(),
      deletedAt: data?.get('deleted_at')?.toDateTime(),
      telegramUsername: data?.get('telegram_username')?.toText(),
      telegramConnected: data?.get('telegram_connected')?.toBoolean(),
      tfaEnabled: data?.get('tfa_connected')?.toBoolean(),
      partnerId: data?.get('partner_id')?.toText(),
      crmPartnerIds: [],
      emailConfirmed: data?.get('email_confirmed')?.toBoolean(),
      phoneConfirmed: data?.get('phone_confirmed')?.toBoolean(),
    );
  }
}
