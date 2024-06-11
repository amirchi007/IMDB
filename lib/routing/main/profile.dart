import 'package:flutter/material.dart';
import 'package:imdb/pages/appbar/main.dart';
import 'package:imdb/pages/main/home.dart';
import 'package:imdb/pages/main/userprofile.dart';
import 'package:imdb/pages/main/search.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  int currentPageIndex = 2;
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
        const SearchPage(),
        //RatingAndReviewsPage()
        ProfilePage(),
      ][currentPageIndex],
      // body: UserProfilePage(),
    );
  }
}
