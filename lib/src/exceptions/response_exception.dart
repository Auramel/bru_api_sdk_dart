// Package imports:
import 'package:dio/dio.dart';

class ResponseException {
  final String message;
  final Response response;

  ResponseException(
    this.response,
    [this.message = 'Response exception']
  );

  @override
  String toString() => 'ResponseException: $message';
}
