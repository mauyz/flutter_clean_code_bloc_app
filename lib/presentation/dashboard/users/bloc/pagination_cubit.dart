import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class PaginationCubit extends Cubit<int> {
  PaginationCubit() : super(1);

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
}
