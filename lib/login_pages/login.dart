import 'package:flutter/material.dart';
import 'package:imdb/login_pages/resource.dart';

//Login Page
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool remember_me = false;
  bool password_show = true;
  IconData password_icon = Icons.visibility;
  final loginUsername = TextEditingController();
  final loginPassword = TextEditingController();
  final _logincardKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20),
            Heading('Sign in'),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Form(
                key: _logincardKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: loginUsername,
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
                      decoration: Input('Email', 'Enter Your Email'),
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      controller: loginPassword,
                      validator: (value) {
                        // ignore: non_constant_identifier_names
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
                              if (password_show == true) {
                                password_show = false;
                                password_icon = Icons.visibility_off;
                              } else {
                                password_show = true;
                                password_icon = Icons.visibility;
                              }
                            });
                          },
                          icon: Icon(password_icon),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: [
                            Checkbox(
                              value: remember_me,
                              onChanged: (bool? value) {
                                setState(() {
                                  remember_me = value!;
                                });
                              },
                              checkColor: Colors.black,
                              activeColor: const Color(0xFFF5C418),
                            ),
                            const Text(
                              'Remember Me',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        TxtBtn('Forgot Password?'),
                      ],
                    ),
                    const SizedBox(height: 50),
                    Container(
                      width: double.infinity,
                      decoration: ShadowBtn(),
                      child: ElevatedButton(
                        onPressed: () async {
                          // if (_logincardKey.currentState!.validate()) {
                          // http
                          // .post(
                          // Uri.parse(
                          // 'http://192.168.43.154/api/login'),
                          // headers: {
                          // HttpHeaders.contentTypeHeader:
                          // 'application/json; charset=UTF-8',
                          // },
                          // body: jsonEncode({
                          // 'username': loginUsername.text,
                          // 'password': loginPassword.text,
                          // }),
                          // )
                          // .then((value) => {
                          // if (value.statusCode == 200)
                          // {
                          // toastification.show(
                          // backgroundColor: Colors.green,
                          // context: context,
                          // title: const Text(
                          // "Login up successfully"),
                          // autoCloseDuration:
                          // const Duration(
                          // seconds: 3)),
                          // Get.to(const OgCard())
                          // }
                          // else
                          // {
                          // toastification.show(
                          // backgroundColor: Colors.red,
                          // context: context,
                          // title: const Text(
                          // "The information is invalid"),
                          // autoCloseDuration:
                          // const Duration(
                          // seconds: 3))
                          // }
                          // })
                          // .onError((error, stackTrace) => {});
                          // }
                          // Get.to(const OgCard());
                        },
                        style: StyleBtn(Colors.black, const Color(0xFFF5C418)),
                        child: const Text("Login"),
                      ),
                    ),
                    const SizedBox(height: 25),
                    LineTxt('New to IMDB?'),
                    const SizedBox(height: 25),
                    Container(
                      width: double.infinity,
                      decoration: ShadowBtn(),
                      child: ElevatedButton(
                        onPressed: () async {
                          // if (_logincardKey.currentState!.validate()) {
                          // http
                          // .post(
                          // Uri.parse(
                          // 'http://192.168.43.154/api/login'),
                          // headers: {
                          // HttpHeaders.contentTypeHeader:
                          // 'application/json; charset=UTF-8',
                          // },
                          // body: jsonEncode({
                          // 'username': loginUsername.text,
                          // 'password': loginPassword.text,
                          // }),
                          // )
                          // .then((value) => {
                          // if (value.statusCode == 200)
                          // {
                          // toastification.show(
                          // backgroundColor: Colors.green,
                          // context: context,
                          // title: const Text(
                          // "Login up successfully"),
                          // autoCloseDuration:
                          // const Duration(
                          // seconds: 3)),
                          // Get.to(const OgCard())
                          // }
                          // else
                          // {
                          // toastification.show(
                          // backgroundColor: Colors.red,
                          // context: context,
                          // title: const Text(
                          // "The information is invalid"),
                          // autoCloseDuration:
                          // const Duration(
                          // seconds: 3))
                          // }
                          // })
                          // .onError((error, stackTrace) => {});
                          // }
                          // Get.to(const OgCard());
                        },
                        style: StyleBtn(Colors.white, Colors.black),
                        child: const Text("Create Account"),
                      ),
                    ),
                    const SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        TxtBtn('Conditions of Use'),
                        TxtBtn('Privacy Notice'),
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
