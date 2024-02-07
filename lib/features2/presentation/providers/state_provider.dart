import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movieapp/features2/domain/entity/movie_entity.dart';
part 'state_provider.freezed.dart';

@freezed
class Stateprovider with _$Stateprovider {
  factory Stateprovider({
    required List<MovieEntity> movies,
    // required List<MovieEntity> trending,
    required List<MovieEntity>? searchmovies,
  }) = _Stateprovider;
}
