class UnknownException implements Exception {}

class ApiException implements Exception {
  final int code;

  ApiException({
    required this.code,
  });
}
