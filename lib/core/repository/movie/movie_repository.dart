import 'package:movie_app/core/core.dart';
import 'package:movie_app/core/network/model/movies.dart';

abstract class MovieRepository {
  Future<ResponseMovie?> getMovieNowPlaying({
    String apiKey = ApiConstant.apiKey,
    String language = ApiConstant.language
  });

  Future<ResponseMovie?> getMovieUpComing({
    String apiKey = ApiConstant.apiKey,
    String language = ApiConstant.language
  });
}
