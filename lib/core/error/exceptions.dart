class UnauthorizedException implements Exception {}

class NotFoundException implements Exception {}

class InternalErrorServerException implements Exception {}

class InternetException implements Exception {}

class ServerException implements Exception {
  final String code;

  ServerException({
    required this.code,
  });
}
