import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movieapp/features2/data/datasource/firebase_datasource.dart';
import 'package:movieapp/features2/data/datasource/firebase_datasource_impl.dart';
import 'package:movieapp/features2/data/models/firebase_model.dart';
import 'package:movieapp/features2/domain/entity/movie_entity.dart';
import 'package:movieapp/features2/domain/repository/firebase_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'firebase_repository_impl.g.dart';

class FirebaseRepositoryimpl extends FirebaseRepository {
  final FirebaseserviseDatasource datasource;
  FirebaseRepositoryimpl({required this.datasource});

  @override
  Future<void> deleteFromFirestore(int id) async {
    await datasource.deleteFromFirestore(id);
  }

  @override
  Future<void> addtofirestore(MovieEntity entity) async {
    final models = Firebasemodel(
        id: entity.id,
        originalTitle: entity.originalTitle,
        overview: entity.overview,
        posterPath: entity.posterPath,
        releaseDate: entity.releaseDate,
        originalLanguage: entity.originalLanguage,
        title: entity.title,
        backdropPath: entity.backdropPath,
        voteAverage: entity.voteAverage);
    await datasource.addtofirestore(models);
  }

  @override
  Stream<List<MovieEntity>> getfavoriteMovies() async* {
    final QuerySnapshot = datasource.getfavoriteMovies();
    await for (final doc in QuerySnapshot) {
      final data = doc.docs;
      yield [
        for (final model in data)
          MovieEntity(
              originalTitle: model.data().originalTitle,
              overview: model.data().overview,
              posterPath: model.data().posterPath,
              title: model.data().title,
              id: model.data().id,
              voteAverage: model.data().voteAverage,
              backdropPath: model.data().backdropPath,
              releaseDate: model.data().releaseDate,
              originalLanguage: model.data().originalLanguage)
      ];
    }
  }
}

@riverpod
FirebaseRepository firebaseRepository(FirebaseRepositoryRef ref) {
  return FirebaseRepositoryimpl(
      datasource: (ref.watch(firebaseDatasourceProvider)));
}
