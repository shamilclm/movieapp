import 'package:freezed_annotation/freezed_annotation.dart';
part 'movie_entity.freezed.dart';

@freezed
class MovieEntity with _$MovieEntity {
  const factory MovieEntity(
      {required String originalTitle,
      required String overview,
      required String posterPath,
      required String title,
      required int id,
      required double voteAverage,
      required String backdropPath,
      required DateTime releaseDate,
      required String originalLanguage}) = _MovieEntity;
}
