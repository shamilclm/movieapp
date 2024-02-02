import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movieapp/core/exeption/auth/base_exeption.dart';
import 'package:movieapp/core/utils/show_snackbar_utils.dart';
import 'package:movieapp/features2/data/repository/firebase_repository_impl.dart';
import 'package:movieapp/features2/data/repository/movie_repository_impl.dart';
import 'package:movieapp/features2/domain/entity/comment_entity.dart';
import 'package:movieapp/features2/domain/entity/movie_entity.dart';
import 'package:movieapp/features2/domain/usecase/addcomment_usecase.dart';
import 'package:movieapp/features2/domain/usecase/deletefirestore_usecase.dart';
import 'package:movieapp/features2/domain/usecase/firestore_usecase.dart';
import 'package:movieapp/features2/domain/usecase/getcomment_usecase.dart';
import 'package:movieapp/features2/domain/usecase/getfavorite_usecase.dart';
import 'package:movieapp/features2/domain/usecase/movie_usecase.dart';
import 'package:movieapp/features2/domain/usecase/searchmovie_usecase.dart';
import 'package:movieapp/features2/domain/usecase/trendingmovie_usecase.dart';
import 'package:movieapp/features2/presentation/providers/state_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'movie_provider.g.dart';

@riverpod
class Movie extends _$Movie {
  final PageController pageController = PageController();
  @override
  Future<Stateprovider> build() async {
    final repository = ref.watch(movierepositoryProvider);
    final result = await Future.wait([
      MovieUsecase(repository: repository)(),
      TrendingMovieUsecase(repository: repository)(),
    ]);
    return Stateprovider(
        movies: result[0], trending: result[1], searchmovies: null);
  }

  Future<void> addToFirestore(MovieEntity entity) {
    final repository = ref.watch(firebaseRepositoryProvider);
    return FirestoreUsecase(repository: repository)(entity);
  }

  Future<void> deleteFromFirestore(int id) {
    final repository = ref.watch(firebaseRepositoryProvider);
    return DeleteFirestoreUsecase(repository: repository)(id);
  }

  Stream<List<MovieEntity>> getMovies() {
    return GetmoviesUsecase(
        repository: ref.watch(firebaseRepositoryProvider))();
  }

  Future<void> addComment(CommentEntity entity, String id) {
    return CommentUsecase(repository: ref.watch(firebaseRepositoryProvider))(
        entity, id);
  }

  Stream<List<CommentEntity>> getcomment(String id) {
    return GetcommentUsecase(repository: ref.watch(firebaseRepositoryProvider))(
        id);
  }

  Future<void> serchMovies(String text, BuildContext context) async {
    try {
      final repository = ref.watch(movierepositoryProvider);
      final data = await SearchMovieUsecase(repository: repository)(text);
      state = AsyncValue.data(state.value!.copyWith(searchmovies: data));
    } on Baseexeption catch (e) {
      Future.sync(() => SnackbarUtils.showSnackbarMessage(context, e.message));
    }
  }
}

final selected = StateProvider((ref) => 0);
