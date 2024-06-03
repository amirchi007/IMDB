import 'package:flutter/material.dart';
import 'package:imdb/pages/appbar/auth.dart';
import 'package:imdb/pages/auth/login.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AuthAppbarPage(),
      body: LoginPage(),
    );
  }
}
