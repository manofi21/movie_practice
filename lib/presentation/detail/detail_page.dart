import 'package:flutter/material.dart';
import 'package:movie_web_practice/entities/movie_entities.dart';
import 'package:movie_web_practice/presentation/detail/widget/long_detail_movie_widget.dart';

class DetailPage extends StatefulWidget {
  final MovieEntities movieEntities;
  const DetailPage({super.key, required this.movieEntities});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detail Movie")),
      body: LongDetailMovieWidget(
            title: widget.movieEntities.title,
            description: widget.movieEntities.description,
            releaseDate: widget.movieEntities.releaseDate,
            posterUrl: widget.movieEntities.posterUrl,
            ageRating: widget.movieEntities.ageRating,
            ticketPrice: widget.movieEntities.ticketPrice,
          ),
    );
  }
}
