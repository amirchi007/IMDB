import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';
import 'package:imdb/pages/main/movie.dart';
import 'package:imdb/pages/main/profile.dart';
import 'package:imdb/pages/main/rating.dart';
import 'package:imdb/pages/main/search.dart';
import 'package:imdb/routing/auth/login.dart';
import 'package:imdb/routing/main/movie.dart';

shadowtxt() {
  return const BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: Color.fromARGB(255, 34, 33, 33),
        blurRadius: 8,
      ),
    ],
  );
}

heading(String title) {
  return Text(
    title,
    style: const TextStyle(
      fontFamily: 'Roboto',
      fontSize: 22,
      fontWeight: FontWeight.bold,
      shadows: [
        Shadow(
          color: Colors.grey, // Shadow color
          offset: Offset(2, 2), // Position of the shadow
          blurRadius: 3, // Spread radius of the shadow
        ),
      ],
    ),
  );
}

input(String label, String hinttext) {
  return InputDecoration(
    label: Text(label),
    hintText: hinttext,
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.grey),
      borderRadius: BorderRadius.circular(10),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.black,
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
  );
}

txtbtn(String? title, VoidCallback onPressed) {
  return TextButton(
    onPressed: onPressed,
    child: Text(
      title!,
      style: const TextStyle(
        color: Colors.grey,
      ),
    ),
  );
}

txtbtnhome(String? title,  VoidCallback onPressed) {
  return TextButton(
 onPressed: onPressed,
    child: Text(
      title!,
      style: const TextStyle(
        color: Color(0xFFF5C418),
      ),
    ),
  );
}

shadowbtn() {
  return BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 2,
        blurRadius: 5,
        offset: const Offset(0, 3), // changes position of shadow
      ),
    ],
  );
}

stylebtn(Color foregroundColor, Color backgroundColor, double vertical,
    double horizontal, double fontsize,) {
  return ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    foregroundColor: foregroundColor,
    backgroundColor: backgroundColor,
    padding: EdgeInsets.symmetric(vertical: (vertical), horizontal: horizontal),
    textStyle: TextStyle(
      fontSize: fontsize,
    ),
  );
}

stylebtnn(Color foregroundColor, Color backgroundColor, double vertical,
    double horizontal, double fontsize,VoidCallback onPressed) {
  return  
  ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    foregroundColor: foregroundColor,
    backgroundColor: backgroundColor,
    padding: EdgeInsets.symmetric(vertical: (vertical), horizontal: horizontal),
    textStyle: TextStyle(
      fontSize: fontsize,
    ),
  );
}



SizedBoxE(String imagePath, String title) {
  return InkWell(
    onTap: () {
      // Get.to(UserProfilePage());
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7.0),
      child: Column(
        children: <Widget>[
          Image.asset(imagePath),
          txtstyle(title, Colors.black, 15, FontWeight.w700),
        ],
      ),
    ),
  );
}

linetxtlogin(String title) {
  return Row(
    children: <Widget>[
      Image.asset('assets/images/line.png'),
      const SizedBox(width: 40),
      Text(title),
      const SizedBox(width: 40),
      Image.asset('assets/images/line.png'),
    ],
  );
}

linetxtsignup(String title) {
  return Row(
    children: <Widget>[
      Image.asset('assets/images/line.png'),
      const SizedBox(width: 10),
      Text(title),
      const SizedBox(width: 10),
      Image.asset('assets/images/line.png'),
    ],
  );
}

checkbox(String title, double fontsize) {
  return Text(
    title,
    style: TextStyle(
      color: const Color.fromARGB(255, 0, 0, 0),
      decoration: TextDecoration.none,
      fontFamily: 'Roboto',
      fontSize: fontsize,
      fontWeight: FontWeight.w400,
    ),
  );
}

txtstyle(String title, Color color, double fontsize, FontWeight fontWeight) {
  return Text(
    title,
    style: TextStyle(
      color: color,
      fontSize: fontsize,
      fontFamily: 'Roboto',
      fontWeight: fontWeight,
    ),
  );
}

//slider show
final List<String> imgList = [
  'assets/images/shogun.jpg#nima#When a mysterious European ship is found marooned in a nearby fishing village,',
  'assets/images/shogun.jpg#amin#When a mysterious European ship is found marooned in a nearby fishing village,',
  'assets/images/shogun.jpg#ali#When a mysterious European ship is found marooned in a nearby fishing village,',
];

List<Widget> imageSliders() {
  return imgList.map((item) {
    String images = item.split('#')[0];
    String title = item.split('#')[1];
    String explain = item.split('#')[2];
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(5.0)),
      child: Stack(
        children: <Widget>[
          Image.asset(
            images,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(200, 0, 0, 0),
                    Color.fromARGB(0, 0, 0, 0),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   txtstyle(title, Color(0xFFF5C418), 17, FontWeight.normal),
                  txtstyle(explain, Colors.white, 10, FontWeight.normal),
                  evaluatedButton('See More', () {
                    Get.to(const MovieRouting());
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }).toList();
}
                   

Widget evaluatedButton(String text, VoidCallback onPressed) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      backgroundColor: Color(0xFFF5C418), 
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5), 
      ),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5), 
      minimumSize: Size(0, 0)
    ),
    child: Text(
      text,
      style: const TextStyle(color: Colors.black), 
    ),
  );
}

tags(String title) {
  return Chip(
    label: Text(title),
    backgroundColor: const Color.fromARGB(255, 241, 240, 240),
    labelPadding: const EdgeInsets.symmetric(horizontal: 8),
    labelStyle: const TextStyle(
        fontSize: 15, fontFamily: 'Roboto', fontWeight: FontWeight.bold),
  );
}

//horizontal slider
Widget MovieSlider(String imagePath, String title) {
  return InkWell(
    onTap: () {
      Get.to(const MovieRouting());
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7.0),
      child: Column(
        children: <Widget>[
          Image.asset(imagePath),
          txtstyle(title, Colors.black, 15, FontWeight.w700),
        ],
      ),
    ),
  );
}

//list search movie
Widget MovieSearch(String imagePath, double screenWidth, String title,
    String number, String date, String time, String rate) {
  return Column(
    children: [
      InkWell(
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: screenWidth * 0.8,
              height: 70,
              child: Row(
                children: [
                  Image.asset(imagePath),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      txtstyle("${number} ${title}", Colors.black, 15,
                          FontWeight.bold),
                      Row(
                        children: [
                          const SizedBox(width: 10),
                          txtstyle(date, Colors.grey, 12, FontWeight.normal),
                          const SizedBox(width: 20),
                          txtstyle(time, Colors.grey, 12, FontWeight.normal),
                        ],
                      ),
                      Row(
                        children: [
                          const SizedBox(width: 5),
                          const Icon(
                            Icons.star,
                            color: Color.fromARGB(255, 255, 152, 17),
                            size: 15,
                          ),
                          const SizedBox(width: 5),
                          txtstyle(
                              rate,
                              const Color.fromARGB(255, 255, 152, 17),
                              13,
                              FontWeight.normal),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            const Icon(Icons.movie),
          ],
        ),
      ),
      const SizedBox(height: 10),
    ],
  );
}

movieproperties(IconData icon, String title) {
  return Row(
    children: [
      Icon(
        icon,
        color: const Color.fromARGB(255, 255, 152, 17),
        size: 15,
      ),
      const SizedBox(width: 5),
      txtstyle(
          title, const Color.fromARGB(255, 255, 152, 17), 12, FontWeight.bold),
    ],
  );
}

moviedetails(String head, String sub, double width) {
  return SizedBox(
    width: width,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        txtstyle(head, Colors.black, 15, FontWeight.bold),
        txtstyle(
          sub,
          const Color.fromARGB(255, 158, 158, 158),
          14,
          FontWeight.normal,
        ),
      ],
    ),
  );
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