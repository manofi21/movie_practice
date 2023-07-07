import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movie_web_practice/converter/double_to_idr_money.dart';

import '../converter/int_age_to_icon_rating_age.dart';

class ShortDetailMovieWidget extends StatelessWidget {
  final String titleMovie;
  final int ticketPrice;
  final DateTime releaseDate;
  final int ageRating;
  const ShortDetailMovieWidget({
    super.key,
    required this.releaseDate,
    required this.titleMovie,
    required this.ticketPrice,
    required this.ageRating,
  });

  Widget childItem(String title, {String? content, Widget? widget}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Expanded(
        flex: 2,
        child: Text(
          '$title :',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
      ),
      if (content != null) ...{
        Text(
          content,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
      },
      if (widget != null) ...{
        widget,
      }
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final released = DateFormat('EEEE, dd MMMM yyyy', 'id_ID').format(
      releaseDate,
    );

    final currencyTicketPrice = currencyIdrString(ticketPrice);

    final ageRatingString = intAgeToIconRatingAge(ageRating);

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.5, 2),
          stops: [0.5, 1],
          colors: [
            Colors.black,
            Colors.transparent,
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              titleMovie,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            childItem('Tanggal Release', content: released),
            const SizedBox(height: 10),
            childItem('Harga Ticket', content: currencyTicketPrice),
            const SizedBox(height: 10),
            childItem(
              'Rating Umur film',
              widget: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 1.3
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 5),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Text(
                      ageRatingString,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text(
                    '\n(Disarankan ${ageRating.toString()} Tahun)',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
