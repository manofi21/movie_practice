import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../converter/int_age_to_icon_rating_age.dart';

class LongDetailMovieWidget extends StatefulWidget {
  final String title;
  final String description;
  final DateTime releaseDate;
  final String posterUrl;
  final int ageRating;
  final int ticketPrice;
  const LongDetailMovieWidget({
    super.key,
    required this.title,
    required this.description,
    required this.releaseDate,
    required this.posterUrl,
    required this.ageRating,
    required this.ticketPrice,
  });

  @override
  State<LongDetailMovieWidget> createState() => _LongDetailMovieWidgetState();
}

class _LongDetailMovieWidgetState extends State<LongDetailMovieWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 300,
          width: 230,
          // child: Container(
          //   decoration: BoxDecoration(
          //     image: DecorationImage(image: NetworkImage(widget.posterUrl))
          //   ),
          // ),
          child: CachedNetworkImage(
            fit: BoxFit.fill,
            placeholder: (context, url) => const SizedBox(
              height: 50,
              width: 50,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
            imageUrl: widget.posterUrl,
          ),
        ),
        SizedBox(
          width: 450,
          child: DescriptionSide(
            title: widget.title,
            description: widget.description,
            releaseDate: widget.releaseDate,
            ageRating: widget.ageRating,
            ticketPrice: widget.ticketPrice,
          ),
        ),
      ],
    );
  }
}

class DescriptionSide extends StatelessWidget {
  final String title;
  final String description;
  final DateTime releaseDate;
  final int ageRating;
  final int ticketPrice;
  const DescriptionSide({
    super.key,
    required this.title,
    required this.description,
    required this.releaseDate,
    required this.ageRating,
    required this.ticketPrice,
  });

  Widget childItem(String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 2, child: Text(title)),
          const SizedBox(
            width: 15,
          ),
          Expanded(flex: 2, child: Text(": $content")),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final released = DateFormat('EEEE, dd MMMM yyyy', 'id_ID').format(
      releaseDate,
    );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            children: [
              childItem('Title', title),
              childItem('Tanggal Release', released),
              childItem('Description', description),
            ],
          ),
        ),
        intAgeToIconRatingAge(ageRating, color: Colors.black),
      ],
    );
  }
}
