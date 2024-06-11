import 'package:flutter/material.dart';
import 'package:imdb/routing/auth/login.dart';
import 'package:imdb/pages/resource/profile_resource.dart';
import 'package:imdb/pages/resource/resource.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class UserProfilePage extends StatefulWidget {
  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  bool _showChangePassword = false;
  late Future<User> user;
  String id = '';
  String email = '';
  String profileImageUrl = '';
  List<Movie> favoriteMovies = [];

  @override
  void initState() {
    super.initState();
    _loadUserData();
    _loadFavoriteMovies();
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      id = prefs.getString('id') ?? 'Unknown ID';
      email = prefs.getString('email') ?? 'example@gmail.com';
    });
  }

  Future<void> _loadFavoriteMovies() async {
    try {
      final response =
          await http.get(Uri.parse('http://localhost:3000/favorite-movies'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body) as List;
        setState(() {
          favoriteMovies = data.map((json) => Movie.fromJson(json)).toList();
        });
      } else {
        _loadLocalFavoriteMovies();
      }
    } catch (e) {
      _loadLocalFavoriteMovies();
    }
  }

  void _loadLocalFavoriteMovies() {
    setState(() {
      favoriteMovies = [
        Movie(title: 'Movie 1', imageUrl: 'assets/images/unsplash1.png'),
        Movie(title: 'Movie 2', imageUrl: 'assets/images/unsplash2.png'),
        Movie(title: 'Movie 3', imageUrl: 'assets/images/unsplash3.png'),
        Movie(title: 'Movie 4', imageUrl: 'assets/images/unsplash4.png'),
        Movie(title: 'Movie 5', imageUrl: 'assets/images/unsplash5.png'),
        Movie(title: 'Movie 6', imageUrl: 'assets/images/unsplash6.png'),
        Movie(title: 'Movie 7', imageUrl: 'assets/images/unsplash7.png'),
        Movie(title: 'Movie 8', imageUrl: 'assets/images/unsplash8.png'),
        Movie(title: 'Movie 9', imageUrl: 'assets/images/unsplash9.png'),
        // Add more local movies here
      ];
    });
  }

  void _showPasswordChangeSuccessMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Password changed successfully!'),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _toggleChangePassword() {
    setState(() {
      _showChangePassword = !_showChangePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: profileImageUrl.isNotEmpty
                        ? NetworkImage(profileImageUrl)
                        : const AssetImage("assets/images/profile.png")
                            as ImageProvider,
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        txtstyle(id, Colors.black, 20, FontWeight.bold),
                        txtstyle(
                            email,
                            const Color.fromARGB(255, 122, 122, 122),
                            15,
                            FontWeight.normal),
                      ],
                    ),
                  )
                ],
              ),
            ),
            if (!_showChangePassword)
              FavoriteMoviesSection(movies: favoriteMovies),
            if (!_showChangePassword)
              Column(
                children: [
                  const SizedBox(height: 20),
                  // ChangePasswordButton(onPressed: _toggleChangePassword),
                  ElevatedButton(
                    onPressed: () {
                      _showChangePassword = !_showChangePassword;
                    },
                    style: stylebtn(Colors.white, Colors.black, 15, 115, 15),
                    child: const Text("Change Password"),
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () async {
                      Get.to(const Login());
                    },
                    style: stylebtn(Colors.white, Colors.black, 15, 150, 15),
                    child: const Text("Logout"),
                  ),
                ],
              ),
            if (_showChangePassword)
              ChangePasswordSection(
                  onToggle: _toggleChangePassword,
                  onPasswordChanged: _showPasswordChangeSuccessMessage),
          ],
        ),
      ),
    );
  }
}
