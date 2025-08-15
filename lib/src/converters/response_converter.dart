// Package imports:
import 'package:dart_qjson/dart_qjson.dart';

// Project imports:
import 'package:bru_api_sdk_dart/src/exceptions/exception_with_message.dart';

abstract class ResponseConverter {
  static bool isSuccess(final JsonObject json) {
    return (
      json.containsKey('status'))
      && (
        (json.get('status')?.toText() ?? '') == 'success' 
        || (json.get('status')?.toText() ?? '') == 'ok'
      );
  }

  static void checkOnSuccess(final JsonObject json) {
    if (!isSuccess(json)) {
      throw ExceptionWithMessage(getErrorMessage(json));
    }
  }


  static List<String> getErrorMessages(final JsonObject json) {
    if (json.containsKey('errors')) {
      return List<String>.from(json.getList('errors')?.data ?? []);
    }

    return [];
  }

  static String getErrorMessage(final JsonObject json) {
    if (json.containsKey('error_text')) {
      return json.get('error_text')?.toText() ?? '';
    }

    return '';
  }

  static List<T> listFromGraphQL<T>({
    required final String response,
    required final String name,
    required final Function(JsonObject?) builder,
  }) {
    if (response.isEmpty) {
      return [];
    }

    final JsonObject json = JsonObject.fromJsonString(response);

    final List<Map<String, dynamic>> rawData = List.from(json.getObject('data')?.getList(name)?.data ?? []);
    final List<T> data = [];

    for (final Map<String, dynamic> json in rawData) {
      final dynamic item = builder(JsonObject(json));
      
      if (item != null) {
        data.add(item);
      }
    }

    return data;
  }

  static List<T> listFromRest<T>({
    required final String response,
    required final String name,
    required final Function(JsonObject?) builder,
  }) {
    if (response.isEmpty) {
      return [];
    }
    
    final JsonObject json = JsonObject.fromJsonString(response);

    final List<Map<String, dynamic>> rawData = List.from(json.getList(name)?.data ?? []);
    final List<T> data = [];

    for (final Map<String, dynamic> json in rawData) {
      final dynamic item = builder(JsonObject(json));
      if (item != null) {
        data.add(item);
      }
    }

    return data;
  }

  static T object<T>({
    required final String response,
    required final String name,
    required final Function(JsonObject?) builder,
  }) {
    final JsonObject jsonObject = JsonObject.fromJsonString(response);

    if (jsonObject.containsKey('data')) {
      return builder(jsonObject.getObject('data')?.getObject(name)) as T;
    }

    return builder(JsonObject.empty());
  }
}
