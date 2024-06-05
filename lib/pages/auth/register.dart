import 'package:flutter/material.dart';
import 'package:imdb/pages/resource.dart';
import 'package:imdb/routing/auth/privacy_notice.dart';
import 'package:imdb/routing/auth/condition_of_use.dart';
import 'package:imdb/routing/auth/login.dart';
import 'package:toastification/toastification.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool remember_me = false;
  bool password_show = true;
  bool isLoading = false; // متغیر برای مدیریت وضعیت بارگذاری
  IconData password_icon = Icons.visibility;
  final SignUpCardName = TextEditingController();
  final SignUpCardUsername = TextEditingController();
  final SignUpCardEmail = TextEditingController();
  final SignUpCardPassword = TextEditingController();
  final _SignUpCardcardKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Center(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20),
            heading('Sign up'),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Form(
                key: _SignUpCardcardKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: SignUpCardName,
                      validator: (value) {
                        RegExp name = RegExp(
                            r'(^[A-Za-z]{3,16})([ ]{0,1})([A-Za-z]{3,16})?([ ]{0,1})?([A-Za-z]{3,16})?([ ]{0,1})?([A-Za-z]{3,16})');
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Your Name';
                        } else if (!name.hasMatch(value)) {
                          return 'Your Name is not valid';
                        }
                        return null;
                      },
                      decoration: input('Full Name', 'Enter Your Name'),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: SignUpCardUsername,
                      validator: (value) {
                        RegExp username = RegExp(r'^[a-zA-Z0-9_-]{3,20}$');
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Your Username';
                        } else if (!username.hasMatch(value)) {
                          return 'Your Username is not valid';
                        }
                        return null;
                      },
                      decoration: input('Username', 'Enter Your Username'),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: SignUpCardEmail,
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
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: SignUpCardPassword,
                      validator: (value) {
                        RegExp Password2Regex =
                            RegExp(r'^(?=.*[a-zA-Z])(?=.*\d)(?=.*\w).{8,}$');
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Your Password';
                        } else if (!Password2Regex.hasMatch(value)) {
                          return "Your Password Is Wrong";
                        }
                        return null;
                      },
                      obscureText: password_show,
                      decoration: InputDecoration(
                        label: const Text('Password'),
                        hintText: 'Enter Your Password',
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
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              password_show = !password_show;
                              password_icon = password_show
                                  ? Icons.visibility
                                  : Icons.visibility_off;
                            });
                          },
                          icon: Icon(password_icon),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Transform.scale(
                          scale: 1,
                          child: Checkbox(
                            value: remember_me,
                            onChanged: (bool? value) {
                              setState(() {
                                remember_me = value!;
                              });
                            },
                            checkColor: Colors.black,
                            activeColor: const Color(0xFFF5C418),
                          ),
                        ),
                        checkbox(
                            'I agree to the platforms Terms of Service and Privacy Policy',
                            11)
                      ],
                    ),
                    const SizedBox(height: 20),
                    Container(
                      height: 43,
                      width: double.infinity,
                      decoration: shadowbtn(),
                      child: ElevatedButton(
                        onPressed: isLoading
                            ? null
                            : () async {
                                if (_SignUpCardcardKey.currentState!
                                    .validate()) {
                                  setState(() {
                                    isLoading = true; // شروع بارگذاری
                                  });

                                  http
                                      .post(
                                    Uri.parse(
                                        'http://192.168.43.154/api/register'),
                                    headers: {
                                      HttpHeaders.contentTypeHeader:
                                          'application/json; charset=UTF-8',
                                    },
                                    body: jsonEncode({
                                      'name': SignUpCardName.text,
                                      'email': SignUpCardUsername.text,
                                      'phone': SignUpCardEmail.text,
                                      'password': SignUpCardPassword.text,
                                    }),
                                  )
                                      .then((value) {
                                    setState(() {
                                      isLoading = false; // پایان بارگذاری
                                    });

                                    if (value.statusCode == 200) {
                                      toastification.show(
                                          backgroundColor: Colors.green,
                                          context: context,
                                          title: const Text(
                                              "Signed up successfully"),
                                          autoCloseDuration:
                                              const Duration(seconds: 3));
                                      Get.to(const Login());
                                    } else if (value.statusCode == 409) {
                                      toastification.show(
                                          backgroundColor: Colors.red,
                                          context: context,
                                          title: const Text(
                                              "Account already exists"),
                                          autoCloseDuration:
                                              const Duration(seconds: 3));
                                    } else {
                                      toastification.show(
                                          backgroundColor: Colors.red,
                                          context: context,
                                          title: const Text(
                                              "The information is invalid"),
                                          autoCloseDuration:
                                              const Duration(seconds: 3));
                                    }
                                  }).onError((error, stackTrace) {
                                    setState(() {
                                      isLoading =
                                          false; // پایان بارگذاری در صورت بروز خطا
                                    });

                                    toastification.show(
                                        backgroundColor: Colors.red,
                                        context: context,
                                        title: const Text(
                                            "The information is invalid"),
                                        autoCloseDuration:
                                            const Duration(seconds: 3));
                                  });
                                } else {
                                  toastification.show(
                                      backgroundColor: Colors.red,
                                      context: context,
                                      title: const Text(
                                          "The information is invalid"),
                                      autoCloseDuration:
                                          const Duration(seconds: 3));
                                }
                              },
                        style: stylebtn(
                            Colors.black, const Color(0xFFF6B100), 0, 30, 15),
                        child: isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const Text("Create Account"),
                      ),
                    ),
                    const SizedBox(height: 25),
                    linetxtsignup('Already have an Account?'),
                    const SizedBox(height: 25),
                    Container(
                      width: double.infinity,
                      decoration: shadowbtn(),
                      child: ElevatedButton(
                        onPressed: () async {
                          Get.to(const Login());
                        },
                        style: stylebtn(Colors.white, Colors.black, 20, 30, 15),
                        child: const Text("Login"),
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
    ));
  }
}
