import 'package:flutter/material.dart';

//Login Page
class ConditionOfUse extends StatefulWidget {
  const ConditionOfUse({super.key});

  @override
  State<ConditionOfUse> createState() => _ConditionOfUseState();
}

class _ConditionOfUseState extends State<ConditionOfUse> {
  final forgotPasswordEmail = TextEditingController();
  final _logincardKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: const Color(0xFFFFB409),
        child: const Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              Text(
                'Certainly! Below are the Conditions of Use for this',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 20),
              Text(
                textAlign: TextAlign.justify,
                'IMDb Privacy NoticeAt IMDb , we understand that your privacy  matters.This Privacy  Notice outlines  how  we  collect and process your personal information when you use IMDb Services. By using our services , you consent to the practices described below.',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 20),
              Text(
                textAlign: TextAlign.justify,
                '''
program :
  Acceptance of Terms: By using this program, you agree to abide by these Conditions of Use. If you do not agree with any part of these terms, please refrain from using the program.
    Use of the Program :
    You may use this program for personal, non-commercial purposes.
    You may not modify, distribute, or reverse engineer the program without explicit permission.
  Privacy and Data Collection :
    We respect your privacy. Any data collected during your interaction with this program will be handled in accordance with our Privacy Policy.
    We do not collect personally identifiable information unless explicitly provided by you.
  Intellectual Property :
    All content generated by this program is protected by intellectual property laws.
    You may not reproduce, distribute, or use this content for commercial purposes without permission.
  Disclaimer of Warranties :
    This program is provided “as is” without any warranties or guarantees.
    We do not guarantee the accuracy, reliability, or suitability of the content generated.
  Limitation of Liability :
    We are not liable for any direct, indirect, incidental, or consequential damages arising from the use of this program.
  Termination :
    We reserve the right to terminate your access to this program at any time without notice.
''',
              ),
              SizedBox(height: 20),
              Text(
                textAlign: TextAlign.justify,
                "Remember to use this program responsibly and enjoy the experience! ✨",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}