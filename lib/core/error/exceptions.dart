class ApiException implements Exception {
  final int code;

  ApiException({
    required this.code,
  });
}

sealed class UnknownException extends ApiException {
  UnknownException() : super(code: -1);
}
