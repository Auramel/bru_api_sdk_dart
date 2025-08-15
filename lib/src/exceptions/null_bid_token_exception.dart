class NullBidTokenException implements Exception {
  final String message;

  NullBidTokenException([this.message = 'Bid token is null']);

  @override
  String toString() => 'NullBidTokenException: $message';
}
