import 'package:flutter/material.dart';
import 'package:imdb/routing/main/main.dart';
import 'package:imdb/pages/resource.dart';
import 'package:get/get.dart';

class MainAppbarPage extends StatelessWidget implements PreferredSizeWidget {
  const MainAppbarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: shadowtxt(),
      child: AppBar(
        title: Image.asset('assets/images/imdb1.png'),
        backgroundColor: const Color(0xFFF5C418),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
