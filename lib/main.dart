import 'package:flutter_localizations/flutter_localizations.dart'; 
import 'package:flutter/material.dart';
import 'package:movie_web_practice/presentation/list_movie_page.dart';
import 'package:movie_web_practice/service/movie_service.dart';
import 'package:provider/provider.dart';

import 'repository/movie_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
      home: MultiProvider(
        providers: [
          Provider(
            create: (context) => MovieRepository(
              MovieService(),
            ),
          )
        ],
        child: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: const ListMoviePage(),
    );
  }
}
