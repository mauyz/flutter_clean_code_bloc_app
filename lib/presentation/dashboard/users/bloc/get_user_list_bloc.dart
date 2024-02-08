import 'package:cross_platform_app/core/error/failure.dart';
import 'package:cross_platform_app/domain/entities/user.dart';
import 'package:cross_platform_app/domain/usecases/user/get_user_list_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'get_user_list_event.dart';
part 'get_user_list_state.dart';

@injectable
class GetUserListBloc extends Bloc<GetUserListEvent, GetUserListState> {
  final GetUserListUseCase getUserListUseCase;
  GetUserListBloc({
    required this.getUserListUseCase,
  }) : super(
          GetUserListInitial(),
        ) {
    on<GetUserListByPageEvent>(_getUserListByPageHandler);
  }

  _getUserListByPageHandler(
      GetUserListByPageEvent event, Emitter<GetUserListState> emit) async {
    final usersMap = state.usersMap;
    if (event.forceRefresh != true && usersMap.containsKey(event.page)) {
      emit(
        GetUserListLoaded(
          page: event.page,
          usersMap: usersMap,
        ),
      );
    } else {
      emit(
        GetUserListLoading(
          usersMap: usersMap,
          page: event.page,
        ),
      );
      final result = await getUserListUseCase(event.page);
      result.fold(
        (l) => emit(
          GetUserListFailed(
            failure: l,
            usersMap: usersMap,
            page: event.page,
          ),
        ),
        (r) {
          usersMap[event.page] = r;
          emit(
            GetUserListLoaded(
              usersMap: usersMap,
              page: event.page,
            ),
          );
        },
      );
    }
  }
}
