import 'package:flutter/material.dart';
import 'package:imdb/pages/resource.dart';

class AuthAppbarPage extends StatelessWidget implements PreferredSizeWidget {
  const AuthAppbarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: shadowtxt(),
      child: AppBar(
        title: Center(child: Image.asset('assets/images/imdb1.png')),
        backgroundColor: const Color(0xFFF5C418),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
