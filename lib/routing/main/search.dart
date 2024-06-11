import 'package:flutter/material.dart';
import 'package:imdb/pages/appbar/main.dart';
import 'package:imdb/pages/main/search.dart';

int currentPageIndex = 0;

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MainAppbarPage(),
      body: SearchPage(),
    );
  }
}
