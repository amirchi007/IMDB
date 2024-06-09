import 'package:flutter/material.dart';
import 'package:imdb/routing/auth/login.dart';
import 'package:imdb/pages/resource.dart';
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
            height: 400,
            width: 400,
            child: GridView.builder(
              gridDelegate:const  SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 0.2,
                mainAxisSpacing: 1,
                mainAxisExtent: 231
              ),
              itemCount: 10,
              itemBuilder: (context, index) {
                return MovieCard(
                    'Title $index', 'assets/images/unsplash${index + 1}.png');
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
      margin: const EdgeInsets.all(4.0),
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(imagePath,
                fit: BoxFit.none, height: 200, width: 150),
          ),
          //const SizedBox(height: 3),
          Text(
            title,
            style: const TextStyle(fontSize: 14),
           //overflow: TextOverflow.ellipsis,
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
        style: stylebtn(Colors.white, Colors.black, 10, 400, 15),
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
            style: stylebtn(Colors.white, Colors.black, 10, 400, 20),
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
        style: stylebtn(Colors.white, Colors.black, 10, 400, 15),
      ),
    );
  }
}

class User {
  final String name;
  final String email;
  final List<String> favorites;

  User({required this.name, required this.email, required this.favorites});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
      favorites: List<String>.from(json['favorites']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'favorites': favorites,
    };
  }
}

Future<void> saveUser(User user) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('name', user.name);
  prefs.setString('email', user.email);
  prefs.setStringList('favorites', user.favorites);
}

Future<User?> loadUser() async {
  final prefs = await SharedPreferences.getInstance();
  final name = prefs.getString('name');
  final email = prefs.getString('email');
  final favorites = prefs.getStringList('favorites') ?? [];

  if (name != null && email != null) {
    return User(name: name, email: email, favorites: favorites);
  }
  return null;
}

ButtonStyle stylebtn(Color clr, Color clr2, double rad, double w, double fntsz) {
  return ElevatedButton.styleFrom(
    backgroundColor: clr2,
    foregroundColor: clr,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(rad),
    ),
    fixedSize: Size(w, 45),
    textStyle: TextStyle(fontSize: fntsz),
  );
}
