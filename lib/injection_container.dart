import 'package:get_it/get_it.dart';
import 'features/splash/presentation/cubit/splash_cubit.dart';
import 'package:dio/dio.dart';
import 'core/network/dio_client.dart';
import 'core/network/auth_interceptor.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Core
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton<DioClient>(() => DioClient(sl()));
  sl.registerLazySingleton<AuthInterceptor>(() => AuthInterceptor());

  // Features - Register Feature dependencies here
  // Features - Splash
  sl.registerFactory(() => SplashCubit());
}
