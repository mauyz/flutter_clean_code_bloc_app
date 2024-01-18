import 'package:cross_platform_app/core/error/failure.dart';
import 'package:cross_platform_app/domain/entities/user.dart';
import 'package:cross_platform_app/domain/usecases/user/get_user_by_id.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_user_event.dart';
part 'get_user_state.dart';

class GetUserBloc extends Bloc<GetUserEvent, GetUserState> {
  final GettUserById gettUserById;

  GetUserBloc({required this.gettUserById}) : super(const GetUserInitial()) {
    on<GetUserEvent>(_getUserByIdHandler);
  }

  _getUserByIdHandler(GetUserEvent event, Emitter<GetUserState> emit) async {
    emit(const GetUserLoading());
    final result = await gettUserById(event.id);
    result.fold(
      (l) => emit(GetUserFailed(failure: l)),
      (r) => emit(GetUserLoaded(user: r)),
    );
  }
}
