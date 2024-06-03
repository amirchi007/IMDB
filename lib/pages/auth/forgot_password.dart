import 'package:flutter/material.dart';
import 'package:imdb/pages/resource.dart';
import 'package:imdb/routing/auth/privacy_notice.dart';
import 'package:imdb/routing/auth/condition_of_use.dart';
import 'package:imdb/routing/auth/login.dart';
import 'package:get/get.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final forgotPasswordEmail = TextEditingController();
  final _logincardKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20),
            heading('Forgot Password'),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Form(
                key: _logincardKey,
                child: Column(
                  children: <Widget>[
                    const Text(
                      'To reset your email, please enter a valid email to send the reset password link.',
                      style: TextStyle(
                        color: Colors.grey,
                        decoration: TextDecoration.none,
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: forgotPasswordEmail,
                      validator: (value) {
                        RegExp emailRegex =
                            RegExp(r'^[a-zA-Z0-9._%+-]+@gmail\.com$');
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Your Email';
                        } else if (!emailRegex.hasMatch(value)) {
                          return 'Your Email is wrong';
                        }
                        return null;
                      },
                      decoration: input('Email', 'Enter Your Email'),
                    ),
                    const SizedBox(height: 50),
                    Container(
                      width: double.infinity,
                      decoration: shadowbtn(),
                      child: ElevatedButton(
                        onPressed: () async {
                          //forget password: sent email
                        },
                        style: stylebtn(Colors.white, Colors.black, 20, 30, 15),
                        child: const Text("Continue"),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      decoration: shadowbtn(),
                      child: ElevatedButton(
                        onPressed: () async {
                          Get.to(const Login());
                        },
                        style: stylebtn(
                            Colors.white, const Color(0xFFFFB409), 20, 30, 15),
                        child: const Text("Back"),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        txtbtn('Conditions of Use', const ConditionOfUse()),
                        txtbtn('Privacy Notice', const PrivacyNotice()),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
