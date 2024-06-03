import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserProfilePage extends StatefulWidget {
  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  bool _showChangePassword = false;
  late Future<User> user;

  @override
  void initState() {
    super.initState();
    user = fetchUser();
  }

  Future<User> fetchUser() async {
    final response = await http.get(Uri.parse('https://example.com/api/user'));

    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load user');
    }
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
            FutureBuilder<User>(
              future: user,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData) {
                  return Center(child: Text('No data'));
                } else {
                  return UserInfoSection(user: snapshot.data!);
                }
              },
            ),
            if (!_showChangePassword) FavoriteMoviesSection(),
            if (!_showChangePassword)
              Column(
                children: [
                  ChangePasswordButton(onPressed: _toggleChangePassword),
                  LogoutButton(onPressed: () {
                    // Get.to(Login());
                    // Logout logic here
                  }),
                ],
              ),
            if (_showChangePassword)
              ChangePasswordSection(onToggle: _toggleChangePassword),
          ],
        ),
      ),
    );
  }
}

class UserInfoSection extends StatelessWidget {
  final User user;

  UserInfoSection({required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(user.profilePicture),
          ),
          SizedBox(height: 10),
          Text(
            user.name,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(user.email),
        ],
      ),
    );
  }
}

class FavoriteMoviesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Favorite',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          SizedBox(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                MovieCard('Poor Things', 'assets/images/movie1.jpg'),
                MovieCard('Shawshank Redemption', 'assets/images/movie2.jpg'),
                MovieCard('12 Angry Men', 'assets/images/movie3.jpg'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MovieCard extends StatelessWidget {
  final String title;
  final String imagePath;

  MovieCard(this.title, this.imagePath);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      margin: EdgeInsets.only(right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(imagePath,
                fit: BoxFit.cover, height: 150, width: 120),
          ),
          SizedBox(height: 5),
          Text(
            title,
            style: TextStyle(fontSize: 14),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class ChangePasswordButton extends StatelessWidget {
  final VoidCallback onPressed;

  ChangePasswordButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text('Change Password'),
      ),
    );
  }
}

class ChangePasswordSection extends StatelessWidget {
  final VoidCallback onToggle;

  ChangePasswordSection({required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Change Password',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const TextField(
            decoration: InputDecoration(
              labelText: 'Current Password',
              border: OutlineInputBorder(),
            ),
            obscureText: true,
          ),
          const SizedBox(height: 10),
          const TextField(
            decoration: InputDecoration(
              labelText: 'New Password',
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.visibility_off),
            ),
            obscureText: true,
          ),
          const SizedBox(height: 10),
          const TextField(
            decoration: InputDecoration(
              labelText: 'Repeat Password',
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.visibility_off),
            ),
            obscureText: true,
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Checkbox(
                value: false,
                onChanged: (bool? value) {},
              ),
              Text('Remember Me'),
            ],
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: onToggle,
            child: Text('Change'),
          ),
        ],
      ),
    );
  }
}

class LogoutButton extends StatelessWidget {
  final VoidCallback onPressed;

  LogoutButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        onPressed: onPressed,
        child: const Text('Log out'),
      ),
    );
  }
}

class User {
  final String name;
  final String email;
  final String profilePicture;
  final List<String> favorites;

  User(
      {required this.name,
      required this.email,
      required this.profilePicture,
      required this.favorites});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
      profilePicture: json['profile_picture'],
      favorites: List<String>.from(json['favorites']),
    );
  }
}
