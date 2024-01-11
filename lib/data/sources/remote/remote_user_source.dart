import 'package:cross_platform_app/domain/entities/user.dart';

abstract class RemoteUserSource {
  Future<User> getCurrentUser();
  Future<bool> logOut(User user);
}

class RemoteUserSourceImpl implements RemoteUserSource {
  @override
  Future<User> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<bool> logOut(User user) {
    // TODO: implement logOut
    throw UnimplementedError();
  }
}
