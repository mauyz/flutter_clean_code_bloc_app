import 'package:cross_platform_app/core/error/failure.dart';
import 'package:cross_platform_app/domain/entities/user.dart';
import 'package:cross_platform_app/domain/usecases/user/get_user_list_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'get_user_list_state.dart';
part 'get_user_list_event.dart';

@injectable
class GetUserListBloc extends Bloc<GetUserListEvent, GetUserListState> {
  final GetUserListUseCase getUserListUseCase;

  GetUserListBloc({required this.getUserListUseCase})
      : super(const GetUserListInitial()) {
    on<GetUserListByPageEvent>(_getUserListByPageHandler);
  }
  _getUserListByPageHandler(GetUserListByPageEvent event, Emitter emit) async {
    emit(const GetUserListLoading());
    final result = await getUserListUseCase(event.page);
    result.fold(
      (l) => emit(GetUserListFailed(failure: l)),
      (r) => emit(GetUserListSuccess(users: r)),
    );
  }
}
