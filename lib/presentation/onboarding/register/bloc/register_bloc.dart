import 'package:cross_platform_app/core/error/failure.dart';
import 'package:cross_platform_app/domain/entities/user.dart';
import 'package:cross_platform_app/domain/usecases/user/register_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'register_state.dart';
part 'register_event.dart';

@injectable
class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUseCase registerUseCase;

  RegisterBloc({
    required this.registerUseCase,
  }) : super(const RegisterInitial()) {
    on<RegisterEvent>(_onRegisterEventHandler);
  }

  _onRegisterEventHandler(
      RegisterEvent event, Emitter<RegisterState> emit) async {
    emit(const RegisterSubmitting());
    final result = await registerUseCase(event.data);
    result.fold(
      (l) => emit(RegisterFailed(failure: l)),
      (r) => emit(RegisterSuccess(user: r)),
    );
  }
}
