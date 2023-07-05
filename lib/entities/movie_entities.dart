class MovieEntities {
  final int id;
  final String title;
  final String description;
  final DateTime releaseDate;
  final String posterUrl;
  final int ageRating;
  final int ticketPrice;

  MovieEntities({
    required this.id,
    required this.title,
    required this.description,
    required this.releaseDate,
    required this.posterUrl,
    required this.ageRating,
    required this.ticketPrice,
  });

  MovieEntities copyWith({
    int? id,
    String? title,
    String? description,
    DateTime? releaseDate,
    String? posterUrl,
    int? ageRating,
    int? ticketPrice,
  }) =>
      MovieEntities(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        releaseDate: releaseDate ?? this.releaseDate,
        posterUrl: posterUrl ?? this.posterUrl,
        ageRating: ageRating ?? this.ageRating,
        ticketPrice: ticketPrice ?? this.ticketPrice,
      );
}
