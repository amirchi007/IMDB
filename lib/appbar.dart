import 'package:flutter/material.dart';


Shadow() {
  return const BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: Color.fromARGB(255, 34, 33, 33),
        blurRadius: 8,
      ),
    ],
  );
}

// AppBar for login and signup page
class LoginAppbar extends StatelessWidget implements PreferredSizeWidget {
  const LoginAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: Shadow(),
      child: AppBar(
        title: Center(child: Image.asset('assets/images/imdb1.png')),
        backgroundColor: const Color(0xFFF5C418),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

//Appbar for main pages
class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: Shadow(),
      child: AppBar(
        title: Image.asset('assets/images/imdb1.png'),
        backgroundColor: const Color(0xFFF5C418),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Icon(
              Icons.notifications,
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
