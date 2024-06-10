import 'package:flutter/material.dart';
import 'package:imdb/pages/appbar/rate.dart';

import 'package:imdb/pages/main/rating.dart';


int currentPageIndex = 0;

class RatingRouting extends StatefulWidget {
  const RatingRouting({super.key});

  @override
  State<RatingRouting> createState() => _MovieRoutingState();
}

class _MovieRoutingState extends State<RatingRouting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const RateAppbarPage(),
      body: RatingAndReviewsPage(),
    );
  }
}
