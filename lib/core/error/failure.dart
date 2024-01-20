import 'package:cross_platform_app/core/constants/error_constants.dart';
import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final int code;

  const Failure({required this.code});

  @override
  List<Object?> get props => [code];

  String get message => ErrorConstants.getMessageFromCode(code);
}
