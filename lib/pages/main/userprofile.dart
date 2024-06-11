import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imdb/pages/resource.dart';
import 'package:imdb/routing/main/changepassword.dart';
import 'package:imdb/routing/auth/login.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage("assets/images/profile.png"),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      txtstyle("Nima Malakootikhah", Colors.black, 20,
                          FontWeight.bold),
                      txtstyle(
                          "nima_8a@yahoo.com",
                          const Color.fromARGB(255, 122, 122, 122),
                          15,
                          FontWeight.normal),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          txtstyle("Favorite Movies", Colors.black, 18, FontWeight.bold),
          const SizedBox(height: 20),
          SizedBox(
            height: 350,
            width: 350,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisExtent: 190,
              ),
              itemCount: 9,
              itemBuilder: (BuildContext context, int index) {
                return MovieSlider(
                    'assets/images/unsplash${index + 1}.png', 'Title $index');
              },
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              Get.to(ChangePassword());
            },
            style: stylebtn(Colors.white, Colors.black, 15, 100, 15),
            child: const Text("Change Password"),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              Get.to(const Login());
            },
            style: stylebtn(Colors.white, Colors.black, 15, 135, 15),
            child: const Text("Logout"),
          ),
        ],
      ),
    );
  }
}
