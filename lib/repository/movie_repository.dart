import 'package:movie_web_practice/repository/method/service_model_to_entities.dart';

import '../entities/movie_entities.dart';
import '../service/movie_service.dart';

class MovieRepository {
  final MovieService movieService;
  MovieRepository(this.movieService);

  Future<List<MovieEntities>> getListEntities() async {
    final getListService = await movieService.getMovieListApi();
    final getAsEntities = <MovieEntities>[];
    for (final singelMovie in getListService) {
      final item = movieModelToEntities(singelMovie);
      getAsEntities.add(item);
    }

    return getAsEntities;
  }
}