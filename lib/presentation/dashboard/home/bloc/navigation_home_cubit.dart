import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class NavigationHomeCubit extends Cubit<int> {
  NavigationHomeCubit() : super(0);

  void navigateTo(int index) {
    emit(index);
  }
}
