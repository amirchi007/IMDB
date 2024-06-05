import 'package:flutter/material.dart';
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

class MovieListPage extends StatefulWidget {
  @override
  _MovieListPageState createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  double rating = 0;
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
  List<Movie> filteredMovies = [];

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
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => Icon(
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              onChanged: filterMovies,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredMovies.length,
              itemBuilder: (context, index) {
                final movie = filteredMovies[index];
                return ListTile(
                  leading: Image.asset(movie.imageUrl, width: 50, height: 50, fit: BoxFit.cover),
                  title: Text(movie.title),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${movie.year} • ${movie.duration}'),
                      Row(
                        children: [
                          Text('IMDb: ${movie.rating}'),
                          Icon(Icons.star, color: Colors.yellow, size: 16),
                          SizedBox(width: 8),
                          Text('Your rating: ${movie.userRating}'),
                          IconButton(
                            icon: Icon(Icons.rate_review, color: Colors.blue),
                            onPressed: () => showRatingDialog(movie),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
