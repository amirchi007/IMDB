import 'package:flutter/material.dart';
// import 'package:login_totarial/login/resource.dart';

class RatingAndReviewsPage extends StatefulWidget {
  @override
  _RatingAndReviewsPageState createState() => _RatingAndReviewsPageState();
}

class _RatingAndReviewsPageState extends State<RatingAndReviewsPage> {
  double _rating = 0.0;
  final TextEditingController _reviewController = TextEditingController();
  final List<String> _reviews = [
    '@EpicStoryLover : "The character development in Shogun is phenomenal. I was hooked from the first scene!"',
    '@CinemaNinja : "The battle scenes were incredibly choreographed. Felt like I was transported back in time!"',
    '@PeriodDramaQueen : "The costumes and sets in Shogun are so detailed. It\'s like a visual feast!"',
    '@FilmScoreFanatic : "The score of Shogun is hauntingly beautiful. It really elevates the whole experience."',
    '@HistoryInReels : "Shogun doesn\'t just tell a story, it immerses you in a different era. Absolutely stunning!"',
    '@MovieBuffMark : "I appreciated the attention to cultural accuracy in Shogun. It\'s refreshing to see such respect for the source material."',
    '@Ehsanghasemi : "After watching this movie, I was impressed and decided to teach the \'Kyudo\' method to my students at the best university in Iran (Shamsipur)."',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // x
      // AppBar(
      //   title: const Text('Rating & Reviews'),
      //   backgroundColor: Colors.yellow[700],
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Text('Rating',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                      )),
                  Spacer(),
                  Text('9.2 (IMDb)',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                      )),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: List.generate(5, (index) {
                  return Icon(
                    index < _rating ? Icons.star : Icons.star_border,
                    color: Colors.amber,
                  );
                }),
              ),
              const SizedBox(height: 16),
              const Text('Tap to rate:',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                  )),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () async {
                  final double rating = await showDialog(
                    context: context,
                    builder: (context) => RatingDialog(initialRating: _rating),
                  );

                  setState(() {
                    _rating = rating;
                  });
                },
                child: Row(
                  children: List.generate(5, (index) {
                    return Icon(
                      index < _rating ? Icons.star : Icons.star_border,
                      color: Colors.amber,
                      size: 32,
                    );
                  }),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const CircleAvatar(
                    child: Icon(
                      Icons.person,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: _reviewController,
                      decoration: InputDecoration(
                        hintText: 'Write a review...',
                        hintStyle: const TextStyle(color: Colors.amber),
                        border: const OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.amber),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.amber,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 8),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    if (_reviewController.text.isNotEmpty) {
                      setState(() {
                        _reviews.add('@User : ${_reviewController.text}');
                        _reviewController.clear();
                      });
                    }
                  },
                  // style: StyleBtnR(Colors.black, const Color(0xFFF5C418)),
                  child: const Text("Send Review"),
                ),
              ),
              const Divider(height: 32),
              ..._reviews.map((review) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(review),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class RatingDialog extends StatefulWidget {
  final double initialRating;
  const RatingDialog({required this.initialRating});

  @override
  _RatingDialogState createState() => _RatingDialogState();
}

class _RatingDialogState extends State<RatingDialog> {
  late double _rating;

  @override
  void initState() {
    super.initState();
    _rating = widget.initialRating;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Rate the Movie'),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(5, (index) {
          return IconButton(
            icon: Icon(
              index < _rating ? Icons.star : Icons.star_border,
              color: Colors.amber,
            ),
            onPressed: () {
              setState(() {
                _rating = index + 1.0;
              });
            },
          );
        }),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(_rating);
          },
          child: const Text('Submit'),
        ),
      ],
    );
  }
}