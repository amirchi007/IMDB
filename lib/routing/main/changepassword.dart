import 'package:flutter/material.dart';
import 'package:imdb/pages/main/changepassword.dart';
import 'package:imdb/pages/appbar/main.dart';

int currentPageIndex = 0;

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppbarPage(),
      body: ChangePasswordPage(),
    );
  }
}
