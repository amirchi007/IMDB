import 'package:get/get.dart';
import 'package:imdb/routing/auth/login.dart';
import 'package:imdb/routing/auth/register.dart';
import 'package:imdb/routing/auth/forgot_password.dart';
import 'package:imdb/routing/auth/privacy_notice.dart';
import 'package:imdb/routing/auth/condition_of_use.dart';
import 'package:imdb/routing/main/main.dart';

routes() => [
      GetPage(
        name: '/login',
        page: () => const Login(),
        transition: Transition.circularReveal,
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/register',
        page: () => const Register(),
        transition: Transition.fade,
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/forgotpassword',
        page: () => const ForgotPassword(),
        transition: Transition.fade,
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/privacynotice',
        page: () => const PrivacyNotice(),
        transition: Transition.fade,
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/conditionofuse',
        page: () => const ConditionOfUse(),
        transition: Transition.fade,
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/main',
        page: () => const Main(),
        transition: Transition.fade,
        transitionDuration: const Duration(milliseconds: 500),
      ),
    ];
