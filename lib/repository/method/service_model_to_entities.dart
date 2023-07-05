import 'package:intl/intl.dart';
import 'package:movie_web_practice/entities/movie_entities.dart';

import '../../model/movie_service_model.dart';

MovieEntities movieModelToEntities(MovieServiceModel movieService) {
  final releaseDate = DateFormat('yyyy-MM-dd').parse(movieService.releaseDate);
  return MovieEntities(
    id: movieService.id,
    title: movieService.title,
    description: movieService.description,
    releaseDate: releaseDate,
    posterUrl: movieService.posterUrl,
    ageRating: movieService.ageRating,
    ticketPrice: movieService.ticketPrice,
  );
}
