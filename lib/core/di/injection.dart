import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_app/core/di/injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() {
  getIt.registerSingleton<Dio>(Dio(BaseOptions(
    baseUrl: 'http://192.168.1.79:3000',
  )));
  getIt.init();
}
