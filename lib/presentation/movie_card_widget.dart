import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../entities/movie_entities.dart';
import 'short_detail_movie_widget.dart';

class MovieCardWidget extends StatefulWidget {
  final MovieEntities movieItem;
  final int index;

  const MovieCardWidget({
    super.key,
    required this.movieItem,
    required this.index,
  });

  @override
  State<MovieCardWidget> createState() => _MovieCardWidgetState();
}

class _MovieCardWidgetState extends State<MovieCardWidget> {
  var visibleShortDetail = false;

  void onHovered(bool isHoverd) => setState(() {
        visibleShortDetail = isHoverd;
      });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onExit: (detail) => onHovered(false),
      onEnter: (detail) => onHovered(true),
      child: Stack(
        children: [
          CachedNetworkImage(
            fit: BoxFit.fill,
            placeholder: (context, url) => const SizedBox(
              height: 50,
              width: 50,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
            imageUrl: widget.movieItem.posterUrl,
          ),
          visibleShortDetail
              ? ShortDetailMovieWidget(
                titleMovie: widget.movieItem.title,
                releaseDate: widget.movieItem.releaseDate,
                ticketPrice: widget.movieItem.ticketPrice,
                ageRating: widget.movieItem.ageRating,
              )
              : Container(),
        ],
      ),
    );
  }
}
