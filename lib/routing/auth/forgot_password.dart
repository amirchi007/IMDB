import 'package:flutter/material.dart';
import 'package:imdb/pages/appbar/auth.dart';
import 'package:imdb/pages/auth/forgot_password.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AuthAppbarPage(),
      body: ForgotPasswordPage(),
    );
  }
}
