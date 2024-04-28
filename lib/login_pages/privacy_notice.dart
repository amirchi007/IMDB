import 'package:flutter/material.dart';

//Login Page
class PrivacyNotice extends StatefulWidget {
  const PrivacyNotice({super.key});

  @override
  State<PrivacyNotice> createState() => _PrivacyNoticeState();
}

class _PrivacyNoticeState extends State<PrivacyNotice> {
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
                'IMDb Privacy Notice',
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
Types of Personal Information Collected :
Information You Give Us: When you interact with IMDb Services, we collect information you provide. While some 
details are optional, providing certain information enhances your IMDb experience.
      
Automatic Information:
We automatically collect data about your use of IMDb Services, including interactions with content and services. This includes using cookies and unique identifiers.
Information from Other Sources: We may receive additional information from third-party login services.
      
Purposes of Collecting Personal Information:
Service Operation and Improvement: We use your data to provide, enhance, and troubleshoot IMDb Services. This includes processing payments, analyzing performance, and improving usability.
      
Recommendations and Personalization:
  IMDb tailors recommendations based on your preferences, making your experience more personalized.
      
Legal Compliance :
  In some cases, we collect and use your information to comply with legal requirements.
      
Communication :
  We communicate with you via email or on-site forums.
      
      Advertising :
  Personalized ads are displayed based on your interests.
      
Sharing Information with Third Parties:
We notify you when personal information might be shared with third parties. You have the option to decline sharing.
Remember, IMDb values ​​your trust and handles your information carefully. For the full Privacy Notice, visit the IMDb Privacy page1.
      
If you ever receive suspicious emails claiming to be from IMDb, be cautious. Delete them without opening attachments or clicking links. Legitimate communication from IMDb will not ask for your username or password 2.
      ''',
              ),
              SizedBox(height: 20),
              Text(
                textAlign: TextAlign.justify,
                "Feel free to explore IMDb's vast database of movies and TV shows, and enjoy your cinematic journey! 🎬🍿",
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
