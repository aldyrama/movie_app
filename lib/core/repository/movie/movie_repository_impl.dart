import 'package:movie_app/core/network/api/api_constant.dart';
import 'package:movie_app/core/network/model/movies.dart';
import 'package:movie_app/core/repository/movie/movie_repository.dart';
import 'package:movie_app/core/repository/movie/remote/movie_api_repository.dart';

import 'local/movie_local_repository.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieApiRepository remote;
  final MovieLocalRepository local;

  MovieRepositoryImpl({required this.remote, required this.local});

  @override
  Future<ResponseMovie> getMovieNowPlaying({String apiKey = ApiConstant.apiKey, String language = ApiConstant.language}) {
    // TODO: implement getMovieNowPlaying
    throw UnimplementedError();
  }

  @override
  Future<ResponseMovie> getMovieUpComing({String apiKey = ApiConstant.apiKey, String language = ApiConstant.language}) async{
    final data = await remote.getMovieUpComing(apiKey: apiKey, language: language);
    return data;
    // try {
    //   print("check data local : null");
    //   var fromLocal = await local.getMovieUpComing(apiKey: apiKey, language: language);
    //   print("check data local : $fromLocal");
    //   if (fromLocal != null) {
    //     return fromLocal;
    //   } else {
    //     print("check data local error :");
    //     throw Exception();
    //   }
    // } catch (_) {
    //   final data = await remote.getMovieUpComing(apiKey: apiKey, language: language);
    //   print("check data remote : $data");
    //   local.saveMovieUpComing(data);
    //   return data;
    // }
  }

}