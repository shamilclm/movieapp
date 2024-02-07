import 'package:movieapp/features2/data/repository/movie_repository_impl.dart';
import 'package:movieapp/features2/domain/entity/trailer_entity.dart';
import 'package:movieapp/features2/domain/usecase/trailer_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'trailer_provider.g.dart';

@riverpod
Future<List<Trailerentity>> trailer(TrailerRef ref, String movieId) async {
  return await VideoUseCase(repository: ref.read(movierepositoryProvider))(
      movieId);
}
