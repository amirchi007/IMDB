import 'package:flutter/material.dart';
import 'package:imdb/login_pages/resource.dart';

//Login Page
class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
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
            Heading('Forgot Password'),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Form(
                key: _logincardKey,
                child: Column(
                  children: <Widget>[
                    const Text(
                        'To reset your email, please enter a valid email to send the reset password link.'),
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
                      decoration: Input('Email', 'Enter Your Email'),
                    ),
                    const SizedBox(height: 50),
                    Container(
                      width: 300,
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
                        child: const Text("Continue"),
                      ),
                    ),
                    const SizedBox(height: 25),
                    Container(
                      width: 300,
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
                        child: const Text("Back"),
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
