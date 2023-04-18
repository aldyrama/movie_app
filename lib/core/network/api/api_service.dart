
import 'package:dio/dio.dart';
import 'package:movie_app/core/network/model/movies.dart';

class ApiService {
  final Dio dio;

  ApiService({required this.dio});


  Future<ResponseMovie> getMovieUpComing(String apiKey, String language) async {
    try {
      final response = await dio.get("movie/upcoming", queryParameters: {"api_key": apiKey, "language": language});
      return ResponseMovie.fromJson(response.data);
    } on DioError catch (e) {
      return e.error;
    }
  }
}