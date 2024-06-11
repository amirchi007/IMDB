import 'package:flutter/material.dart';
import 'package:imdb/pages/main/filter.dart';
import 'package:imdb/pages/appbar/main.dart';

int currentPageIndex = 0;

class Filter extends StatefulWidget {
  const Filter({super.key});

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppbarPage(),
      body: FilterPage(),
    );
  }
}
