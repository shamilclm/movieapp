import 'package:dio/dio.dart';
import 'package:movieapp/core/exeption/auth/base_exeption.dart';
import 'package:movieapp/features2/domain/entity/trailer_entity.dart';
import 'package:movieapp/features2/domain/repository/movie_repository.dart';

final class VideoUseCase {
  final MovieRepository repository;
  VideoUseCase({required this.repository});

  Future<List<Trailerentity>> call(String id) async {
    try {
      final videos = await repository.addTrailer(id);
      final trailers = videos
          .where((video) => video.type.toLowerCase().trim() == 'trailer')
          .toList();
      return trailers;
    } catch (e) {
      throw Baseexeption(
          'Error while loading \n ${(e is DioException) ? e.type : e}');
    }
  }
}
