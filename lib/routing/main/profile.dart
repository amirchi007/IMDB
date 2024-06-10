import 'package:flutter/material.dart';
import 'package:imdb/pages/appbar/main.dart';
import 'package:imdb/pages/main/home.dart';
import 'package:imdb/pages/main/profile.dart';
import 'package:imdb/pages/main/search.dart';

int currentPageIndex = 0;

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppbarPage(),
      body: UserProfilePage(),
    );
  }
}
