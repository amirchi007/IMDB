import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imdb/pages/resource.dart';
import 'package:imdb/routing/main/profile.dart';
import 'package:toastification/toastification.dart';

class ChangePasswordPage extends StatefulWidget {
  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _repeatPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 22,
                ),
                txtstyle(
                    "Change Password", Colors.black, 18, FontWeight.normal),
                const SizedBox(
                  height: 18,
                ),
                TextFormField(
                  controller: _currentPasswordController,
                  decoration:
                      input("Current Password", "Enter Your Current Password"),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your current password';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 22,
                ),
                TextFormField(
                  controller: _newPasswordController,
                  decoration: input("New Password", "Enter Your New Password"),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a new password';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 22,
                ),
                TextFormField(
                  controller: _repeatPasswordController,
                  decoration:
                      input("Repeat Password", "Enter Your Repeat Password"),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please repeat your new password';
                    }
                    if (value != _newPasswordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 250,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Get.to(const Profile());
                      Get.snackbar(
                        'Success',
                        'Password changed successfully',
                        snackPosition: SnackPosition.TOP,
                        backgroundColor: Colors.green,
                        icon: const Icon(
                          Icons.check_sharp,
                          color: Colors.black,
                          size: 20,
                        ),
                      );
                    }
                  },
                  style: stylebtn(
                      Colors.black, const Color(0xFFF6B100), 15, 160, 15),
                  child: const Text("Change"),
                ),
                const SizedBox(
                  height: 22,
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.to(const Profile());
                  },
                  style: stylebtn(Colors.white, Colors.black, 15, 162, 15),
                  child: const Text("Cancel"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
