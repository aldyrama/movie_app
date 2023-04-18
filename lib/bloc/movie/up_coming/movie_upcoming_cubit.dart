import 'package:bloc/bloc.dart';
import 'package:movie_app/bloc/movie/up_coming/movie_upcoming_state.dart';
import 'package:movie_app/core/network/api/api_constant.dart';
import 'package:movie_app/core/repository/movie/movie_repository.dart';
import 'package:movie_app/utils/result_data.dart';

class MovieUpcomingCubit extends Cubit<MovieUpcomingState> {
  final MovieRepository repository;

  MovieUpcomingCubit({required this.repository}): super(
    MovieUpcomingState(state: ResultData.initial()),
  );

  getMovieUpcoming({String apiKey = ApiConstant.apiKey, String language = ApiConstant.language}) async{
    try {
      emit(state.copyWith(state: ResultData.loading(message: 'Loading')),);

      final service = await repository.getMovieUpComing();
      print("check service : $service");
      if (service != null) {
        if (service.results.isEmpty) {
          emit(state.copyWith(state: ResultData.empty(message: 'Kosong')));
        } else {
          emit(state.copyWith(state: ResultData.loaded(data: service)));
        }
      } else {
        emit(state.copyWith(state: ResultData.empty(message: 'Kosong')));
      }
    } catch (e) {
      print("error cek : ${e.toString()}");
      emit(state.copyWith(state: ResultData.error(message: e.toString())),);
    }
  }

}