/// Custom exception class to handle exceptions in the application
final class CustomException implements Exception {
  /// CustomException constructor
  CustomException(this.message);

  /// Exception message
  final String message;

  @override
  String toString() {
    return 'Exception: $message';
  }
}
