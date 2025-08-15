// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:dio/dio.dart';
import 'package:talker/talker.dart';

class TalkerInterceptor extends Interceptor {
  static final JsonEncoder _encoder = JsonEncoder.withIndent(' ');
  late final Talker _talker;
  final bool printResponseHeaders;

  TalkerInterceptor({
    final Talker? talker,
    this.printResponseHeaders = false,
  }) {
    _talker = talker ?? Talker();
  }

  @override
  void onRequest(final RequestOptions options, final RequestInterceptorHandler handler) {
    _talker.logCustom(
      _RequestLog(
        _generateRequestMessage(request: options),
      ),
    );
    super.onRequest(options, handler);
  }

  @override
  void onResponse(final Response response, final ResponseInterceptorHandler handler) {
    final bool isOk = (
      ((response.statusCode ?? -1) >= 200)
      && ((response.statusCode ?? -1) <= 299)
    );

     _talker.logCustom(
      _ResponseLog(
        _generateResponseMessage(response),
        isOk,
      ),
    );
    super.onResponse(response, handler);
  }

  @override
  Future onError(final DioException err, final ErrorInterceptorHandler handler) async {
     _talker.logCustom(
      _ResponseLog(
        _generateErrorMessage(err),
        false,
      ),
    );
    super.onError(err, handler);
  }

  String _generateRequestMessage({
    required final RequestOptions request,
  }) {
    String msg = '[${request.method.toUpperCase()}] ${request.path}';
    final Map<String, dynamic> headers = request.headers;

    try {
      if (headers.isNotEmpty) {
        msg += '\nHeaders: ${_encoder.convert(headers)}';
      }

      if (request.data != null) {
        msg += '\nBody: ${_formatBody(request.data)}';
      }
    } catch (_) {
      _talker.critical(
        '${request.data}',
      );
    }

    return msg;
  }

  String _generateResponseMessage(final Response response) {
    String msg = '[${response.requestOptions.method.toUpperCase()}] ${response.requestOptions.path}';
    final Map<String, dynamic>? headers = response.headers.map;
    final String? responseMessage = response.statusMessage;
    final dynamic data = response.data;

    msg += '\nStatus: ${response.statusCode}';
    msg += '\nMessage: $responseMessage';

    try {
      if (
        headers != null
        && headers.isNotEmpty
        && printResponseHeaders
      ) {
        msg += '\nHeaders: ${_encoder.convert(headers)}';
      }

      if (data != null) {
        msg += '\nBody: ${_encoder.convert(data)}';
      }

    } catch (_) {
      _talker.critical(
        '${response.data}',
      );
    }

    return msg;
  }

  String _generateErrorMessage(final DioException response) {
    String msg = '[${response.requestOptions.method.toUpperCase()}] ${response.requestOptions.path}';
    final Map<String, dynamic>? headers = response.requestOptions.headers;
    final String? responseMessage = response.message;
    final dynamic data = response.response?.data;

    msg += '\nStatus: ${response.response?.statusCode}';
    msg += '\nMessage: $responseMessage';

    try {
      if (
        headers != null
        && headers.isNotEmpty
        && printResponseHeaders
      ) {
        msg += '\nHeaders: ${_encoder.convert(headers)}';
      }

      if (data != null) {
        msg += '\nBody: ${_encoder.convert(data)}';
      }

    } catch (_) {
      _talker.critical(
        '${response.response?.data}',
      );
    }

    return msg;
  }

  static dynamic _formatBody(final dynamic data) {
    if (data is Map<String, dynamic>) {
      return _encoder.convert(data);
    }

    try {
      return (
        data is String
        && data.isNotEmpty
      )
        ? (jsonDecode(data).toString())
        : _encoder.convert(data);
    } catch (_) {
      return data.toString();
    }
  }
}

class _RequestLog extends TalkerLog {
  _RequestLog(String super.message);

  @override
  String? get title => 'REQUEST';

  @override
  AnsiPen? get pen => AnsiPen()..xterm(219);
}

class _ResponseLog extends TalkerLog {
  final bool isOk;

  _ResponseLog(
    super.message,
    this.isOk,
  );

  @override
  String? get title => 'RESPONSE';

  @override
  AnsiPen? get pen {

    if (isOk) {
      return AnsiPen()..xterm(34);
    } else {
      return AnsiPen()..xterm(160);
    }
  }
}
