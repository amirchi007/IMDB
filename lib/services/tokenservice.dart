import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const FlutterSecureStorage secureStorage = FlutterSecureStorage();

Future<Map<String, String>> getToken() async {
  String? accessToken = await secureStorage.read(key: 'access');

  return {'access': accessToken ?? ''};
}
