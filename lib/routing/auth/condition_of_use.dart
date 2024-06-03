import 'package:flutter/material.dart';
import 'package:imdb/pages/appbar/auth.dart';
import 'package:imdb/pages/auth/condition_of_use.dart';

class ConditionOfUse extends StatelessWidget {
  const ConditionOfUse({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AuthAppbarPage(),
      body: ConditionOfUsePage(),
    );
  }
}
