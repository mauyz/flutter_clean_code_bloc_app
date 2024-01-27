class ApiException implements Exception {
  final int code;

  const ApiException({
    required this.code,
  });
}

class UnknownException extends ApiException {
  const UnknownException() : super(code: -1);
}
