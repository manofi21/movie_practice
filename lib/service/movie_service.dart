import 'package:dio/dio.dart';
import 'package:movie_web_practice/constant/constant.dart';

import '../model/movie_service_model.dart';

class MovieService {
  Future<List<MovieServiceModel>> getMovieListApi() async {
    final dio = Dio(
      BaseOptions(baseUrl: baseUrl),
    );

    final requestListMovie = await dio.get('api/movies');
    final responseListMovie = requestListMovie.data;
    if (responseListMovie is List) {
      final listResult =
          responseListMovie.map((e) => MovieServiceModel.fromMap(e)).toList();
      return listResult;
    }

    return [];
  }
}
