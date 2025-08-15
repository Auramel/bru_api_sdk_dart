class NullTokenException implements Exception {
  final String message;

  NullTokenException([this.message = 'Account is null']);

  @override
  String toString() => 'NullTokenException: $message';
}
