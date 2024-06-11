import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imdb/pages/resource.dart';
import 'package:imdb/routing/main/search.dart';

class FilterPage extends StatefulWidget {
  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20),
            heading('Filter'),
            const SizedBox(height: 20),
            SizedBox(
              width: screenWidth * 0.9,
              child: Wrap(
                spacing: 5,
                runSpacing: 5,
                children: [
                  tags('Adventure'),
                  tags('History'),
                  tags('Drama'),
                  tags('View'),
                  tags('Adventure'),
                  tags('Adventure'),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                // key: _SignUpCardcardKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      // controller: ,
                      validator: (value) {
                        RegExp name = RegExp(
                            r'(^[A-Za-z]{3,16})([ ]{0,1})([A-Za-z]{3,16})?([ ]{0,1})?([A-Za-z]{3,16})?([ ]{0,1})?([A-Za-z]{3,16})');
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Your Name';
                        } else if (!name.hasMatch(value)) {
                          return 'Your Name is not valid';
                        }
                        return null;
                      },
                      decoration: input('Year', '1992-2020'),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Get.to(const Search());
                      },
                      style: stylebtn(
                          Colors.black, const Color(0xFFF6B100), 15, 160, 15),
                      child: const Text("Apply"),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Get.to(const Search());
                      },
                      style: stylebtn(Colors.white, Colors.black, 15, 155, 15),
                      child: const Text("Cancel"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
