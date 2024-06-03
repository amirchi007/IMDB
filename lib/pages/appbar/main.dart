import 'package:flutter/material.dart';
import 'package:imdb/pages/auth/register.dart';
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
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: IconButton(
              onPressed: () {
                Get.to(const RegisterPage());
              },
              icon: const Icon(Icons.account_circle),
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
