import 'package:movie_app/core/network/api/api_constant.dart';
import 'package:movie_app/core/network/api/api_service.dart';
import 'package:movie_app/core/network/model/movies.dart';
import 'package:movie_app/core/repository/movie/movie_repository.dart';

class MovieApiRepository extends MovieRepository {
  final ApiService apiService;

  MovieApiRepository({required this.apiService});

  @override
  Future<ResponseMovie> getMovieNowPlaying({String apiKey = ApiConstant.apiKey, String language = ApiConstant.language}) {
    // TODO: implement getMovieNowPlaying
    throw UnimplementedError();
  }

  @override
  Future<ResponseMovie> getMovieUpComing({String apiKey = ApiConstant.apiKey, String language = ApiConstant.language}) {
    return apiService.getMovieUpComing(apiKey, language);
  }

}