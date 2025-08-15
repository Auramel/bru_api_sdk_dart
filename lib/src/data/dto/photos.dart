// Package imports:
import 'package:dart_qjson/dart_qjson.dart';

class Photos {
  final String? small;
  final String? medium;
  final String? large;

  Photos({
    required this.small,
    required this.medium,
    required this.large,
  });

  factory Photos.fromJson(final JsonObject json) {
    return Photos(
      small: json.get('small')?.toText(),
      medium: json.get('medium')?.toText(),
      large: json.get('large')?.toText(),
    );
  }
}
