import 'package:equatable/equatable.dart';
import 'package:movie_app/core/network/model/movies.dart';
import 'package:movie_app/utils/utils.dart';

class MovieUpcomingState extends Equatable {
  final ResultData<ResponseMovie> state;

  const MovieUpcomingState({
    required this.state,
  });

  MovieUpcomingState copyWith({
    ResultData<ResponseMovie>? state,
  }) {
    return MovieUpcomingState(
      state: state ?? this.state,
    );
  }

  @override
  List<Object?> get props => [state];
}