import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:imdb/routing/main/main.dart';
import 'package:imdb/services/tokenservice.dart';
import 'package:toastification/toastification.dart';
import 'package:get/get.dart';

class RegisterApiService {
  static String baseUrl = 'http://10.0.2.2/api/top_week';

  static Future<void> loginFormData(
      id, title, description, thumbnail, BuildContext context) async {
    final Dio dio = Dio();
    Map<String, String> tokens  = await getToken(); 
    final accesstokens = tokens["access"];
    try {
      final response = await dio.get(
        baseUrl,
        options: Options(
          headers: {
            "content-type": "application/json; charset=UTF-8",
          },
        ),
      );

      if (response.statusCode == 200) {
        FlutterSecureStorage secureStorage = const FlutterSecureStorage();;
        toastification.show(
          backgroundColor: Colors.green,
          context: context,
          title: const Text("Login Successfully"),
          autoCloseDuration: const Duration(seconds: 3),
        );
        Get.to(const Main());
      }
    } catch (error) {
      print(error);
      toastification.show(
        backgroundColor: Colors.red,
        context: context,
        title: const Text("An error occurred"),
        autoCloseDuration: const Duration(seconds: 3),
      );
    }
  }
}
