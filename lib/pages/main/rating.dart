import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:imdb/pages/resource.dart';

double _rating = 0.0;
final TextEditingController _reviewController = TextEditingController();
final List<Map<String, dynamic>> _reviews = [
  {
    'username': '@EpicStoryLover',
    'review':
        'The character development in Shogun is phenomenal. I was hooked from the first scene!',
    'rating': 9.0,
    'profilePic': 'assets/images/profile.png',
  },
  {
    'username': '@CinemaNinja',
    'review':
        'The battle scenes were incredibly choreographed. Felt like I was transported back in time!',
    'rating': 8.5,
    'profilePic': 'assets/images/profile.png',
  },
  {
    'username': '@PeriodDramaQueen',
    'review':
        'The costumes and sets in Shogun are so detailed. It\'s like a visual feast!',
    'rating': 9.5,
    'profilePic': 'assets/images/profile.png',
  },
  {
    'username': '@FilmScoreFanatic',
    'review':
        'The score of Shogun is hauntingly beautiful. It really elevates the whole experience.',
    'rating': 8.0,
    'profilePic': 'assets/images/profile.png',
  },
  {
    'username': '@HistoryInReels',
    'review':
        'Shogun doesn\'t just tell a story, it immerses you in a different era. Absolutely stunning!',
    'rating': 9.0,
    'profilePic': 'assets/images/profile.png',
  },
  {
    'username': '@MovieBuffMark',
    'review':
        'I appreciated the attention to cultural accuracy in Shogun. It\'s refreshing to see such respect for the source material.',
    'rating': 8.8,
    'profilePic': 'assets/images/profile.png',
  },
  {
    'username': '@Ehsanghasemi',
    'review':
        'After watching this movie, I was impressed and decided to teach the \'Kyudo\' method to my students at the best university in Iran (Shamsipur).',
    'rating': 9.5,
    'profilePic': 'assets/images/profile.png',
  },
];

class RatingAndReviewsPage extends StatefulWidget {
  @override
  _RatingAndReviewsPageState createState() => _RatingAndReviewsPageState();
}

class _RatingAndReviewsPageState extends State<RatingAndReviewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      txtstyle('Rating', Colors.black, 18, FontWeight.bold),
                      const Icon(Icons.star, color: Colors.amber, size: 18),
                      const SizedBox(width: 4),
                      txtstyle('9.2 (IMDb)', Colors.black, 18, FontWeight.bold),
                    ],
                  ),
                  Column(
                      children: List.generate(5, (index) {
                    int stars = 5 - index;
                    double yellowPercentage = [0.9, 0.7, 0.6, 0.2, 0.1][index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Row(
                        children: [
                          Row(
                            textDirection: TextDirection.rtl,
                            children: List.generate(
                                5,
                                (i) => Icon(
                                      i < stars
                                          ? Icons.star
                                          : Icons.star_border,
                                      size: 18,
                                      color: i < stars
                                          ? Colors.black
                                          : Colors.transparent,
                                    )),
                          ),
                          const SizedBox(width: 4),
                          SizedBox(
                            width: 120, // Fixed width for the bars
                            child: Stack(
                              children: [
                                Container(
                                  height: 10,
                                  color: Colors.grey[300],
                                ),
                                FractionallySizedBox(
                                  widthFactor: yellowPercentage,
                                  child: Container(
                                    height: 10,
                                    color: Colors.amber,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  })),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  txtstyle('Tap to rate:', Colors.black, 18, FontWeight.bold),
                  GestureDetector(
                    onTap: () async {
                      final double? rating = await showDialog(
                        context: context,
                        builder: (context) =>
                            RatingDialog(initialRating: _rating),
                      );

                      if (rating != null) {
                        setState(() {
                          _rating = rating;
                        });
                      }
                    },
                    child: Row(
                      children: List.generate(10, (index) {
                        return Icon(
                          index < _rating ? Icons.star : Icons.star_border,
                          color: Colors.amber,
                          size: 25,
                        );
                      }),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _reviewController,
                maxLines: 3,
                decoration: InputDecoration(
                  prefixIcon: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/images/profile.png"),
                        ),
                      ),
                      const SizedBox(width: 8),
                      txtstyle(
                          '@UserName', Colors.black, 14, FontWeight.normal),
                    ],
                  ),
                  hintText: 'Write a review...',
                  hintStyle: const TextStyle(color: Colors.black),
                  border: const OutlineInputBorder(),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.amber),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    if (_reviewController.text.isNotEmpty) {
                      setState(() {
                        _reviews.add({
                          'username': '@User Name',
                          'review': _reviewController.text,
                          'rating': _rating,
                          'profilePic': 'assets/images/profile.png',
                        });
                        _reviewController.clear();
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.amber,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 5,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    child: Text("Send Review"),
                  ),
                ),
              ),
              const Divider(height: 32),
              ..._reviews.map((review) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.black),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(review['profilePic']),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(review['username'],
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(height: 4),
                                Text(review['review']),
                                const SizedBox(height: 8),
                                RatingBarIndicator(
                                  rating: review['rating'],
                                  itemBuilder: (context, index) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  itemCount: 5,
                                  itemSize: 20.0,
                                  direction: Axis.horizontal,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
