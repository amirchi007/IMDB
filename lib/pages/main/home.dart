import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:imdb/pages/resource.dart';
import 'package:imdb/pages/main/profile.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CarouselController _controller = CarouselController();
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Card(
      // shadowColor: const Color.fromARGB(0, 255, 183, 0),
      // margin: const EdgeInsets.all(0),
      child: Column(
        children: [
          Expanded(
            child: CarouselSlider(
              items: imageSliders(),
              carouselController: _controller,
              options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 2.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  }),
            ),
          ),
          const SizedBox(height: 25),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(width: 12),
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                ),
                child: Image.asset(
                  "assets/images/intro.png",
                  height: 150,
                ),
              ),
              const SizedBox(width: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  txtstyle('The Best Of History', Colors.black, 18.5,
                      FontWeight.normal),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Color.fromARGB(255, 255, 152, 17),
                      ),
                      const SizedBox(width: 5),
                      txtstyle(
                          '9.2/10', Colors.black, 18, FontWeight.bold),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Container(
                    width: screenWidth * 0.5,
                    child: Wrap(
                      spacing: 5,
                      runSpacing: 5,
                      children: [
                        tags('Adventure'),
                        tags('History'),
                        tags('Drama'),
                        tags('View'),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const SizedBox(width: 14),
              txtstyle('Top 10 on IMDb this week', Colors.black, 15,
                  FontWeight.bold),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 17),
            height: 184,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return MovieSlider(
                    'assets/images/unsplash${index + 1}.png', 'Title $index');
              },
            ),
          )
        ],
      ),
    );
  }
}
