import 'package:objectbox/objectbox.dart';

@Entity()
class MovieModelEntity {
  @Id()
  int id = 0;
  String originalTitle;
  String overview;
  String posterPath;
  String title;
  int movieid;
  double voteAverage;
  String backdropPath;
  DateTime releaseDate;
  String originalLanguage;

  MovieModelEntity(
      {required this.originalTitle,
      required this.movieid,
      required this.overview,
      required this.posterPath,
      required this.title,
      required this.voteAverage,
      required this.backdropPath,
      required this.releaseDate,
      required this.originalLanguage});
}
