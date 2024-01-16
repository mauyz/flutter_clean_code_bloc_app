import 'package:cross_platform_app/services/dependecy_injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: false,
  asExtension: true,
)
void configureDependecies() => getIt.init();
