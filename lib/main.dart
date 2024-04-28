import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:imdb/appbar.dart';
import 'package:imdb/login_pages/login.dart';
import 'package:imdb/login_pages/create_account.dart';
import 'package:imdb/login_pages/forgot_password.dart';
import 'package:imdb/login_pages/privacy_notice.dart';
import 'package:imdb/login_pages/condition_of_use.dart';

void main(List<String> args) => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: LoginAppbar(),
        body: ConditionOfUse(),
        // body: PrivacyNotice(),
        // body: ForgotPassword(),
        // body: CreateAccount(),
        // body: Login(),
      ),
    );
  }
}
