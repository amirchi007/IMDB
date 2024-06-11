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
  String email = "nima_8a@yahoo.com";
  String id = "Nima Malakootikhah";

  void _editDetails() {
    final emailController = TextEditingController(text: email);
    final idController = TextEditingController(text: id);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: 
           txtstyle(
                    "Edit Details", Colors.purple, 18, FontWeight.normal),
        
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: idController,
                decoration: input("ID", "Enter Your ID")
              ),
              const SizedBox(height: 20,),
              TextFormField(
                controller: emailController,
                decoration: input("Email", "Enter Your Email")
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child:  txtstyle(
                    "Cancel", Colors.purple, 15, FontWeight.normal),
        
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  email = emailController.text;
                  id = idController.text;
                });
                Navigator.of(context).pop();
              },
              child:  txtstyle(
                    "Save", Colors.purple, 15, FontWeight.normal),
        
            ),
            
          ],
        );
      },
    );
  }

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
                      Row(
                        children: [
                          txtstyle(id, Colors.black, 20, FontWeight.bold),
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: _editDetails,
                          ),
                        ],
                      ),
                      txtstyle(
                          email,
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
