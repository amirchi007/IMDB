import 'package:flutter/material.dart';
import 'package:imdb/pages/appbar/auth.dart';
import 'package:imdb/pages/auth/privacy_notice.dart';

class PrivacyNotice extends StatelessWidget {
  const PrivacyNotice({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AuthAppbarPage(),
      body: PrivacyNoticePage(),
    );
  }
}
