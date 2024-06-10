import 'package:flutter/material.dart';
import 'package:imdb/pages/appbar/main.dart';
import 'package:imdb/pages/main/home.dart';
import 'package:imdb/pages/main/movie.dart';
import 'package:imdb/pages/main/profile.dart';
import 'package:imdb/pages/main/search.dart';

int currentPageIndex = 0;

class MovieRouting extends StatefulWidget {
  const MovieRouting({super.key});

  @override
  State<MovieRouting> createState() => _MovieRoutingState();
}

class _MovieRoutingState extends State<MovieRouting> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MainAppbarPage(),
      body: MoviePage(),
    );
  }
}
