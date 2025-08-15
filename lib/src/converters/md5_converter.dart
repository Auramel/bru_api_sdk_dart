// Dart imports:
import 'dart:convert';
import 'dart:typed_data';

// Package imports:
import 'package:crypto/crypto.dart';

abstract class Md5Converter {
  static Digest encodeString(final String string) {
    final Uint8List bytes = utf8.encode(string);
    return md5.convert(bytes);
  }
}
