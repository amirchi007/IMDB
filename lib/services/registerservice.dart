import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:imdb/models/register.dart';
import 'package:imdb/pages/resource.dart';
import 'package:imdb/routing/auth/login.dart';
import 'package:imdb/services/tokenservice.dart';
import 'package:toastification/toastification.dart';
import 'package:get/get.dart';

class RegisterApiService {
  static String baseUrl = 'http://10.0.2.2/api/register';

  static Future<void> registerFormData(
      name, username, email, password, BuildContext context) async {
    final Dio dio = Dio();

    try {
      final Uri uri = Uri.parse(baseUrl).replace(
        queryParameters: {
          'name': name,
          'username': username,
          'email': email,
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
          title: const Text("Register Successfully"),
          autoCloseDuration: const Duration(seconds: 3),
        );
        Get.to(const Login());
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
