import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movies.g.dart';

@JsonSerializable()
class ResponseMovie extends Equatable {
  @JsonKey(name: 'results')
  final List<Movies> results;

  const ResponseMovie([this.results = const []]);

  @override
  List<Object> get props => [results];

  factory ResponseMovie.fromJson(Map<String, dynamic> json) => _$ResponseMovieFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseMovieToJson(this);
}

@JsonSerializable()
class Movies {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'title')
  final String title;

  @JsonKey(name: 'overview')
  final String overview;

  @JsonKey(name: 'release_date')
  final String releaseDate;

  @JsonKey(name: 'genre_ids')
  final List<int> genreIds;

  @JsonKey(name: 'vote_average')
  final double voteAverage;

  @JsonKey(name: 'popularity')
  final double popularity;

  @JsonKey(name: 'poster_path')
  final String posterPath;

  @JsonKey(name: 'backdrop_path')
  final String backdropPath;

  @JsonKey(name: 'original_name')
  final String? tvName;

  @JsonKey(name: 'first_air_date')
  final String? tvRelease;

  const Movies(
      this.id,
      this.title,
      this.overview,
      this.releaseDate,
      this.genreIds,
      this.voteAverage,
      this.popularity,
      this.posterPath,
      this.backdropPath,
      this.tvName,
      this.tvRelease);

  factory Movies.fromJson(Map<String, dynamic> json) => _$MoviesFromJson(json);

  Map<String, dynamic> toJson() => _$MoviesToJson(this);
}
