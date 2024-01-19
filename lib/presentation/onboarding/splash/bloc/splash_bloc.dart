import 'package:cross_platform_app/domain/entities/user.dart';
import 'package:cross_platform_app/domain/usecases/user/get_logged_user.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'splash_event.dart';
part 'splash_state.dart';

@injectable
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final GetLoggedUser getLoggedUser;
  SplashBloc({
    required this.getLoggedUser,
  }) : super(const SplashLoading()) {
    on<SplashEvent>(_getLoggedUserHandler);
  }

  _getLoggedUserHandler(SplashEvent event, Emitter<SplashState> emit) async {
    final result = await getLoggedUser();
    result.fold(
      (l) => null,
      (r) => emit(SplashLoaded(r)),
    );
  }
}
