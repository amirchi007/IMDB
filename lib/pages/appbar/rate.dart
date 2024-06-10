import 'package:flutter/material.dart';
import 'package:imdb/pages/resource/resource.dart';

class RateAppbarPage extends StatelessWidget implements PreferredSizeWidget {
  const RateAppbarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: shadowtxt(),
      child: AppBar(
          backgroundColor: Colors.yellow[700], // Background color of the AppBar
          title:const Text(
                'Rating & Reviews',
                style: TextStyle(color: Colors.black,fontFamily: 'Roboto',fontWeight: FontWeight.bold), // Text color
              ),
        ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}