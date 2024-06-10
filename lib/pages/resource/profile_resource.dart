import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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


class MovieCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String imgurl;
  MovieCard({required this.title, required this.imageUrl,required this.imgurl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              height: 200,
              width: 150,
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  imageUrl,
                  fit: BoxFit.cover,
                  height: 200,
                  width: 150,
                );
              },
            ),
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 14),
          ),
        ],
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
  final List<Movie> movies;
  FavoriteMoviesSection({required this.movies});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Favorite Movies',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 400,
            width: 400,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 0.2,
                mainAxisSpacing: 1,
                mainAxisExtent: 231,
              ),
              itemCount: movies.length,
              itemBuilder: (context, index) {
                return MovieCard(
                  title: movies[index].title,
                  imageUrl: movies[index].imageUrl,
                  imgurl: movies[index].imageUrl,
                );
              },
            ),
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
class LogoutButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  LogoutButton({required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(text),
        style: stylebtn(Colors.white, Colors.black, 10, 400, 15),
      ),
    );
  }
}


class SaveChangesButton extends StatelessWidget {
  final VoidCallback onPressed;

  SaveChangesButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text('Save Changes'),
        style: stylebtn(Colors.white, Colors.black, 10, 400, 15),
      ),
    );
  }
}


class ChangePasswordSection extends StatefulWidget {
  final VoidCallback onToggle;
  final VoidCallback onPasswordChanged;

  ChangePasswordSection({required this.onToggle, required this.onPasswordChanged});

  @override
  _ChangePasswordSectionState createState() => _ChangePasswordSectionState();
}

class _ChangePasswordSectionState extends State<ChangePasswordSection> {
  final TextEditingController _currentPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _isLoading = false;

  void _changePassword() async {
    setState(() {
      _isLoading = true;
    });

    // Simulate an API call for changing password
    await Future.delayed(Duration(seconds: 2));

    setState(() {
      _isLoading = false;
    });

    widget.onPasswordChanged();
    widget.onToggle();
  }

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
            controller: _currentPasswordController,
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
            controller: _newPasswordController,
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
            controller: _confirmPasswordController,
            decoration: InputDecoration(
              label: const Text('Confirm Password'),
              hintText: 'Enter Your Confirm Password',
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
          _isLoading
              ? CircularProgressIndicator()
              : LogoutButton(
                  onPressed: _changePassword,
                  text: 'Save Changes',
                ),
         LogoutButton(
                  onPressed: widget.onToggle,
                  text: 'Cancel',
                ),
        ],
      ),
    );
  }
}

 




stylebtn(
    Color clr, Color clr2, double rad, double w, double fntsz) {
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

class Movie {
  final String title;
  final String imageUrl;

  Movie({required this.title, required this.imageUrl});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['title'],
      imageUrl: json['imageUrl'],
    );
  }
}
