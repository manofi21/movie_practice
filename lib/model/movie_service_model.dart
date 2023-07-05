class MovieServiceModel {
    final int id;
    final String title;
    final String description;
    final String releaseDate;
    final String posterUrl;
    final int ageRating;
    final int ticketPrice;

    MovieServiceModel({
        required this.id,
        required this.title,
        required this.description,
        required this.releaseDate,
        required this.posterUrl,
        required this.ageRating,
        required this.ticketPrice,
    });

    static MovieServiceModel fromMap(Map<String, dynamic> json) => MovieServiceModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        releaseDate: json["release_date"],
        posterUrl: json["poster_url"],
        ageRating: json["age_rating"],
        ticketPrice: json["ticket_price"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "description": description,
        "release_date": releaseDate,
        "poster_url": posterUrl,
        "age_rating": ageRating,
        "ticket_price": ticketPrice,
    };
}
