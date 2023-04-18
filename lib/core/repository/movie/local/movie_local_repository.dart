import 'dart:convert';

import 'package:movie_app/core/local/shared_pref_helper.dart';
import 'package:movie_app/core/network/api/api_constant.dart';
import 'package:movie_app/core/network/model/movies.dart';
import 'package:movie_app/core/repository/movie/movie_repository.dart';
import 'package:movie_app/utils/app_constant.dart';

class MovieLocalRepository extends MovieRepository {
  final SharedPrefHelper prefHelper;

  MovieLocalRepository({required this.prefHelper});

  Future<bool> saveMovieUpComing(ResponseMovie responseMovie) {
    return prefHelper.storeCache(AppConstant.MOVIE_UP_COMING, jsonEncode(responseMovie));
  }

  @override
  Future<ResponseMovie?> getMovieNowPlaying({String apiKey = ApiConstant.apiKey, String language = ApiConstant.language}) {
    // TODO: implement getMovieNowPlaying
    throw UnimplementedError();
  }

  @override
  Future<ResponseMovie?> getMovieUpComing({String apiKey = ApiConstant.apiKey, String language = ApiConstant.language}) async{
    var fromCache = await prefHelper.getCache(AppConstant.MOVIE_UP_COMING);
    if (fromCache != null) {
      Map json = jsonDecode(fromCache);
      print("check data local repo : $json");
      return ResponseMovie.fromJson(json as Map<String, dynamic>);
    }
    return null;
  }

}