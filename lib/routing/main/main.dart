import 'package:flutter/material.dart';
import 'package:imdb/pages/appbar/main.dart';
import 'package:imdb/pages/auth/login.dart';
import 'package:imdb/pages/main/home.dart';
import 'package:imdb/pages/main/search.dart';
import 'package:imdb/pages/main/profile.dart';
import 'package:imdb/pages/main/movie.dart';

int currentPageIndex = 0;

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: const MainAppbarPage(),
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.black,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: const Color(0xFFF5C418),
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined, color: Colors.white),
            label: 'Home',
            tooltip: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.search_outlined),
            icon: Icon(Icons.search_outlined, color: Colors.white),
            tooltip: 'Browser',
            label: 'Browser',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.person_2_outlined),
            icon: Icon(Icons.person_2_outlined, color: Colors.white),
            tooltip: 'Profile',
            label: 'Profile',
          ),
        ],
      ),
      body: <Widget>[
        HomePage(),
        const MoviePage(),
        UserProfilePage(),
      ][currentPageIndex],
    );
  }
}
