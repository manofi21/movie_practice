import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../repository/movie_repository.dart';

class ListMoviePage extends StatefulWidget {
  const ListMoviePage({super.key});

  @override
  State<ListMoviePage> createState() => _ListMoviePageState();
}

class _ListMoviePageState extends State<ListMoviePage> {
  @override
  Widget build(BuildContext context) {
    final movieRepository = context.read<MovieRepository>();
    return FutureBuilder(
      future: movieRepository.getListEntities(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: SizedBox(
              height: 50,
              width: 50,
              child: CircularProgressIndicator(),
            ),
          );
        }

        final movieList = snapshot.data ?? [];
        if (snapshot.hasData) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 400,
              mainAxisSpacing: 5,
              crossAxisSpacing: 10,
              childAspectRatio: 0.5,
            ),
            itemCount: movieList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const SizedBox(
                    height: 50,
                    width: 50,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  imageUrl: movieList[index].posterUrl,
                ),
              );
            },
          );
        }

        return const Center(
          child: Text('Not Have Data'),
        );
      },
    );
  }
}
