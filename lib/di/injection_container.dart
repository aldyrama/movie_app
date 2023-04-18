
import 'package:get_it/get_it.dart';
import 'package:movie_app/bloc/bloc.dart';
import 'package:movie_app/bloc/movie/up_coming/movie_upcoming_cubit.dart';
import 'package:movie_app/core/network/api/api_service.dart';
import 'package:movie_app/core/repository/movie/local/movie_local_repository.dart';
import 'package:movie_app/core/repository/movie/movie_repository.dart';
import 'package:movie_app/core/repository/movie/movie_repository_impl.dart';
import 'package:movie_app/core/repository/movie/remote/movie_api_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/local/shared_pref_helper.dart';
import '../core/network/api/dio_client.dart';

final inject = GetIt.instance;

Future<void> init(String baseUrl) async {
  final preferences = await SharedPreferences.getInstance();
  inject.registerLazySingleton(() => preferences);
  inject.registerLazySingleton(() => SharedPrefHelper(preferences: inject()));

  // Network
  inject.registerLazySingleton(() => ApiService(dio: inject()));
  inject.registerLazySingleton(() => inject<DioClient>().dio);
  inject.registerLazySingleton(() => DioClient(apiBaseUrl: baseUrl));

  // BLoC
  inject.registerFactory(() => ThemeCubit(prefHelper: inject()));
  inject.registerFactory(() => MovieUpcomingCubit(repository: inject()));

  // Repository
  inject.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(remote: inject(), local: inject()));
  inject.registerLazySingleton(() => MovieApiRepository(apiService: inject()));
  inject.registerLazySingleton(() => MovieLocalRepository(prefHelper: inject()));
}
