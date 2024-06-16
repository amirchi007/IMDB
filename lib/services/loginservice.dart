import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:imdb/routing/main/main.dart';
import 'package:toastification/toastification.dart';
import 'package:get/get.dart';

class RegisterApiService {
  static String baseUrl = 'http://10.0.2.2/api/login';

  static Future<void> loginFormData(
       email, password, BuildContext context) async {
    final Dio dio = Dio();

    try {
      final Uri uri = Uri.parse(baseUrl).replace(
        queryParameters: {
          'username': email,
          'password': password,
        },
      );

      final response = await dio.post(
        uri.toString(),
        options: Options(
          headers: {
            "content-type": "application/json; charset=UTF-8",
          },
        ),
      );

      if (response.statusCode == 200) {
        FlutterSecureStorage secureStorage = const FlutterSecureStorage();
        // Ensure 'access' exists in response.data
        await secureStorage.write(
            key: 'access', value: response.data['access']);
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
