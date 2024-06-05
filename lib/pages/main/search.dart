import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:imdb/pages/resource.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Movie {
  final String title;
  final String year;
  final String duration;
  final double rating;
  final String imageUrl;
  double userRating;

  Movie({
    required this.title,
    required this.year,
    required this.duration,
    required this.rating,
    required this.imageUrl,
    this.userRating = 0.0,
  });
}

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController search = TextEditingController();
  final _searchkey = GlobalKey<FormState>();
  double rating = 0;
  List<Movie> filteredMovies = [];
  final List<Movie> movies = [
    Movie(
        title: 'The Shawshank Redemption',
        year: '1994',
        duration: '2h 22m',
        rating: 9.3,
        imageUrl: 'assets/images/1.png'),
    Movie(
        title: 'The Godfather',
        year: '1972',
        duration: '2h 55m',
        rating: 9.2,
        imageUrl: 'assets/images/2.png'),
    Movie(
        title: 'The Dark Knight',
        year: '2008',
        duration: '2h 32m',
        rating: 9.0,
        imageUrl: 'assets/images/4.png'),
    Movie(
        title: 'The Dark Knight',
        year: '2008',
        duration: '2h 32m',
        rating: 9.0,
        imageUrl: 'assets/images/5.png'),
    Movie(
        title: 'The Dark Knight',
        year: '2008',
        duration: '2h 32m',
        rating: 9.0,
        imageUrl: 'assets/images/6.png'),
    Movie(
        title: 'The Dark Knight',
        year: '2008',
        duration: '2h 32m',
        rating: 9.0,
        imageUrl: 'assets/images/7.png'),
    Movie(
        title: 'The Dark Knight',
        year: '2008',
        duration: '2h 32m',
        rating: 9.0,
        imageUrl: 'assets/images/8.png'),
    Movie(
        title: 'The Dark Knight',
        year: '2008',
        duration: '2h 32m',
        rating: 9.0,
        imageUrl: 'assets/images/9.png'),
    Movie(
        title: 'The Dark Knight',
        year: '2008',
        duration: '2h 32m',
        rating: 9.0,
        imageUrl: 'assets/images/10.png'),
    // Add more movies here...
  ];

  @override
  void initState() {
    super.initState();
    filteredMovies = movies;
  }

  void filterMovies(String query) {
    final filtered = movies.where((movie) {
      final titleLower = movie.title.toLowerCase();
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower);
    }).toList();

    setState(() {
      filteredMovies = filtered;
    });
  }

  void showRatingDialog(Movie movie) {
    showDialog(
      context: context,
      builder: (context) {
        double userRating = movie.userRating;
        return AlertDialog(
          title: Text('Rate ${movie.title}'),
          content: RatingBar.builder(
            initialRating: userRating,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              userRating = rating;
            },
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Submit'),
              onPressed: () {
                setState(() {
                  movie.userRating = userRating;
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Form(
              key: _searchkey,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                width: screenWidth * 0.7,
                height: 50,
                child: TextFormField(
                  controller: search,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter Some Text";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Search...",
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 70, 69, 69),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 1,
                      ),
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.search),
                        color: const Color(0xFFF5C418),
                      ),
                    ),
                  ),
                  onChanged: filterMovies,
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.filter_list),
            )
          ],
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: screenHeight * 0.65,
          child: Expanded(
            child: ListView.builder(
              itemCount: filteredMovies.length,
              itemBuilder: (context, index) {
                final movie = filteredMovies[index];
                return ListTile(
                  leading: Image.asset(movie.imageUrl,
                      width: 50, height: 50, fit: BoxFit.cover),
                      
                  title: Text(movie.title),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${movie.year}    ${movie.duration}',
                        style: const TextStyle(
                            fontSize: 13,
                            fontFamily: 'Roboto',
                            color: Colors.grey),
                      ),
                      Row(
                        children: [
                          Text(
                            '${movie.rating}',
                            style: const TextStyle(
                                fontSize: 20,
                                fontFamily: 'Roboto',
                                color: Color.fromARGB(255, 255, 152, 17)),
                          ),
                          const Icon(
                            Icons.star,
                            color: Color.fromARGB(255, 255, 152, 17),
                            size: 15,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Your rating: ${movie.userRating}',
                            style: const TextStyle(
                                fontSize: 14,
                                fontFamily: 'Roboto',
                                color: Colors.grey),
                          ),
                          IconButton(
                            icon: const Icon(Icons.rate_review,
                                 color: Color.fromARGB(255, 255, 152, 17)),
                            onPressed: () => showRatingDialog(movie),
                          ),
                          const SizedBox(
                            height: 0,
                            width: 80,
                          ),
                          const Icon(Icons.movie),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
