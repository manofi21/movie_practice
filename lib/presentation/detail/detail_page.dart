import 'package:flutter/material.dart';
import 'package:movie_web_practice/entities/movie_entities.dart';

class DetailPage extends StatefulWidget {
  final MovieEntities movieEntities;
  const DetailPage({super.key, required this.movieEntities});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [],
    );
  }
}
