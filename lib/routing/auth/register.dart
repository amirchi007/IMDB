import 'package:flutter/material.dart';
import 'package:imdb/pages/appbar/auth.dart';
import 'package:imdb/pages/auth/register.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AuthAppbarPage(),
      body: RegisterPage(),
    );
  }
}
