import 'package:dio/dio.dart';
import 'package:movieapp/core/constants/movie_constants.dart';
import 'package:movieapp/features2/data/datasource/apiservice_datsource.dart';
import 'package:movieapp/features2/data/models/movie_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'apiservice_datasource_impl.g.dart';

class ApiServiceDataSourceImpl extends ApiServiceDataSourse {
  static final dio = Dio();
  final token = Movies.apitoken;
  @override
  Future<MovieModel> getMovies() async {
    dio.options.headers['Authorization'] = 'Bearer $token';
    Response response =
        await dio.get('https://api.themoviedb.org/3/discover/movie');
    return MovieModel.fromJson(response.data);
  }
}

@riverpod
ApiServiceDataSourse apiDataSourse(ApiDataSourseRef ref) {
  return ApiServiceDataSourceImpl();
}
