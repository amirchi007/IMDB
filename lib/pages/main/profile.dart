import 'package:flutter/material.dart';
import 'package:imdb/routing/auth/login.dart';
import 'package:imdb/pages/resource.dart';
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
    final response = await http.get(Uri.parse('https://google.com'));

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
            const CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage("assets/images/profile.png"),
            ),
            const SizedBox(height: 10),
            const Text(
              "amir",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Text("exampel@gmail.com"),
            if (!_showChangePassword) FavoriteMoviesSection(),
            if (!_showChangePassword)
              Column(
                children: [
                  ChangePasswordButton(onPressed: _toggleChangePassword),
                  LogoutButton(onPressed: () {
                    Get.to(Login());
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
class User1 {
  final String name;
  final String email;

  User1({required this.name, required this.email});
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
          const CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage("assets/images/profile.png"),
          ),
          const SizedBox(height: 10),
          Text(
            user.name,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
          const Text(
            'Favorite',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return MovieSlider(
                    'assets/images/unsplash${index + 1}.png', 'Title $index');
              },
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
      margin: const EdgeInsets.only(right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(imagePath,
                fit: BoxFit.cover, height: 150, width: 120),
          ),
          const SizedBox(height: 5),
          Text(
            title,
            style: const TextStyle(fontSize: 14),
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
        style: stylebtn(Colors.white, Colors.black, 10, 140, 12),
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
          const SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
              label: const Text('Current Password'),
              hintText: 'Enter Your Current Password',
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
            ),
            obscureText: true,
          ),
          const SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
              label: const Text('New Password'),
              hintText: 'Enter Your New Password',
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
            ),
            obscureText: true,
          ),
          const SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
              label: const Text('Repeat Password'),
              hintText: 'Repeat Password Here',
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
            ),
            obscureText: true,
          ),
          const SizedBox(height: 200),
          ElevatedButton(
            onPressed: onToggle,
            child: const Text('Change'),
            style: stylebtn(Colors.white, Colors.black, 10, 169, 12),
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
        child: Text('Log out'),
        style: stylebtn(Colors.white, Colors.black, 10, 170, 11),
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
