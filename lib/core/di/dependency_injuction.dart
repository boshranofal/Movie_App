import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/core/apis/home_api_service.dart';
import 'package:movie_app/core/networking/dio_factory.dart';
import 'package:movie_app/core/repos/home_repo.dart';
import 'package:movie_app/logic/cubit/home_cubit.dart';

final getIt = GetIt.instance;

Future<void> setUpGetIt() async {
  ///Dio & ApiService
  Dio dio = DioFactory.getDio();

  //* home
  getIt.registerLazySingleton<HomeApiService>(() => HomeApiService(dio));
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));

  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));
}
