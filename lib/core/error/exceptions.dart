import 'dart:io';

class UnauthorizedException implements Exception {}

class NotFoundException implements Exception {}

class InternalErrorServerException implements Exception {}

class InternetException implements IOException {}

class UnknownException implements Exception {}

class ServerException implements Exception {
  final int code;

  ServerException({
    required this.code,
  });
}
