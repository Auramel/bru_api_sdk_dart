class NullAccountException implements Exception {
  final String message;

  NullAccountException([this.message = 'Token is null']);

  @override
  String toString() => 'NullAccountException: $message';
}
