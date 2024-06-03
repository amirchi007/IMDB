import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imdb/routing/routes.dart';

void main() => runApp(const IMDBApp());

class IMDBApp extends StatelessWidget {
  const IMDBApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        navigationBarTheme: NavigationBarThemeData(
          labelTextStyle:
              MaterialStateProperty.resolveWith<TextStyle>((states) {
            if (states.contains(MaterialState.selected)) {
              return const TextStyle(color: Color(0xFFF5C418));
            }
            return const TextStyle(color: Colors.white);
          }),
        ),
      ),
      title: 'IMDB',
      initialRoute: '/main',
      // initialRoute: '/login',
      // initialRoute: '/register',
      // initialRoute: '/forgotpassword',
      // initialRoute: '/privacynotice',
      // initialRoute: '/conditionofuse',
      getPages: routes(),
    );
  }
}
