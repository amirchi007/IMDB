import 'package:flutter/material.dart';
import 'package:imdb/pages/resource.dart';
import 'package:get/get.dart';
import 'package:imdb/routing/main/rating.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({super.key});

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                "assets/images/shogun.jpg",
                fit: BoxFit.cover,
                width: double.infinity,
                height: 300,
              ),
              Container(
                width: double.infinity,
                height: 300,
                color: Colors.black26,
              ),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(200, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0)
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      txtstyle("Shogun", const Color.fromARGB(255, 255, 152, 17), 20, FontWeight.bold),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          const SizedBox(width: 10),
                          movieproperties(Icons.schedule, "238 minutes"),
                          const SizedBox(width: 10),
                          movieproperties(Icons.star, "9.2/10 (IMDB)"),
                          const SizedBox(width: 10),
                          movieproperties(Icons.star, "9.8 (MyApp)"),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: SizedBox(
                          width: screenWidth * 0.96,
                          child: Wrap(
                            children: [
                              txtstyle(
                                "When  a mysterious European ship is found marooned in a nearby fishing  village, Lord Yoshii Toranaga discovers secrets that could tip the  scales of power and devastate his enemies.",
                                const Color.fromARGB(255, 192, 192, 192),
                                12,
                                FontWeight.normal,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              tags("History"),
              const SizedBox(width: 10),
              tags("Drama"),
              const SizedBox(width: 10),
              tags("Adventure"),
            ],
          ),
          const SizedBox(height: 20),
          Column(
            children: [
              moviedetails("Release date  :", "February 27, 2024", screenWidth * 0.8),
              const SizedBox(height: 10),
              moviedetails("Creators :", "Rachel Kendo , Justin Marks", screenWidth * 0.8),
              const SizedBox(height: 10),
              moviedetails(
                "Stars :",
                "Cosmo Jarvis , Anna Sawai , Tadanobu Asano,",
                screenWidth * 0.8,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  Get.snackbar(
                    'Success',
                    'Movie added successfully',
                    snackPosition: SnackPosition.TOP,
                    backgroundColor: Colors.green,
                    icon: const Icon(
                      Icons.check_sharp,
                      color: Colors.black,
                      size: 20,
                    ),
                  );
                },
                icon: const Icon(
                  Icons.add,
                  color: Colors.black,
                  size: 20,
                ),
                label: txtstyle("Favorite", Colors.black, 15, FontWeight.normal),
                style: stylebtn(Colors.black, const Color(0xFFF6B100), 15, 50, 10),
              ),
              const SizedBox(width: 20),
              ElevatedButton.icon(
                onPressed: () {
                  Get.to(RatingRouting());
                },
                icon: const Icon(
                  Icons.star,
                  color: Colors.black,
                  size: 20,
                ),
                label: txtstyle("Rating", Colors.black, 15, FontWeight.normal),
                style: stylebtn(Colors.black, const Color(0xFFF6B100), 15, 50, 10),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 17),
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) {
                return MovieSlider('assets/images/banner${index + 1}.png', '');
              },
            ),
          ),
        ],
      ),
    );
  }
}
