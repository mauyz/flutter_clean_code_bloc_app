import 'package:cross_platform_app/core/error/failure.dart';
import 'package:cross_platform_app/domain/entities/user.dart';
import 'package:cross_platform_app/domain/usecases/user/log_out_usecase.dart';
import 'package:cross_platform_app/domain/usecases/user/login_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';
part 'auth_event.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final LogOutUseCase logOutUseCase;

  AuthBloc({
    required this.loginUseCase,
    required this.logOutUseCase,
  }) : super(
          const UnAuthenticated(),
        ) {
    on<LogInEvent>(_logInEventHandler);
    on<LogOutEvent>(_logOutEventHandler);
  }
  _logInEventHandler(LogInEvent event, Emitter<AuthState> emit) async {
    emit(const AuthSubmitting());
    final result = await loginUseCase((event.email, event.password));
    result.fold(
      (l) => emit(AuthenticatedFailed(failure: l)),
      (r) => emit(Authenticated(user: r)),
    );
  }

  _logOutEventHandler(LogOutEvent event, Emitter<AuthState> emit) async {
    emit(const AuthSubmitting());
    await logOutUseCase();
    emit(const UnAuthenticated());
  }
}
