import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "https://your-api-url.com";

  // Future<User> login(String emailOrPhone, String password) async {
  //   final response = await http.post(
  //     Uri.parse('$baseUrl/api/login'),
  //     body: {'email': emailOrPhone, 'password': password},
  //   );

  //   if (response.statusCode == 200) {
  //     return User.fromJson(jsonDecode(response.body));
  //   } else {
  //     throw Exception('Failed to login');
  //   }
  // }

  // Future<User> register(String email, String phone, String password) async {
  //   final response = await http.post(
  //     Uri.parse('$baseUrl/api/register'),
  //     body: {'email': email, 'phone': phone, 'password': password},
  //   );

  //   if (response.statusCode == 200) {
  //     return User.fromJson(jsonDecode(response.body));
  //   } else {
  //     throw Exception('Failed to register');
  //   }
  // }

  Future<String> authenticate(String token) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/auth'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['name'];
    } else {
      throw Exception('Failed to authenticate');
    }
  }

  // Future<List<Favorite>> getFavorites(Favorite token) async {
  //   final response = await http.get(
  //     Uri.parse('$baseUrl/api/favorites'),
  //     headers: {'Authorization': 'Bearer $token'},
  //   );

  //   if (response.statusCode == 200) {
  //     Iterable l = jsonDecode(response.body);
  //     return List<Favorite>.from(l.map((model) => Favorite.fromJson(model)));
  //   } else {
  //     throw Exception('Failed to load favorites');
  //   }
  // }

  Future<void> addFavorite(String token, int movieId) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/favorites/$movieId'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to add favorite');
    }
  }

  Future<void> removeFavorite(String token, int movieId) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/api/favorites/$movieId'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to remove favorite');
    }
  }

  Future<void> changeEmail(String token, String email) async {
    final response = await http.patch(
      Uri.parse('$baseUrl/api/change_email'),
      headers: {'Authorization': 'Bearer $token'},
      body: {'email': email},
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to change email');
    }
  }

  Future<void> changePhone(String token, String phone) async {
    final response = await http.patch(
      Uri.parse('$baseUrl/api/change_phone'),
      headers: {'Authorization': 'Bearer $token'},
      body: {'phone': phone},
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to change phone');
    }
  }

  Future<void> changePassword(String token, String oldPassword, String newPassword) async {
    final response = await http.patch(
      Uri.parse('$baseUrl/api/change_password'),
      headers: {'Authorization': 'Bearer $token'},
      body: {'old_password': oldPassword, 'new_password': newPassword},
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to change password');
    }
  }

  Future<void> logout(String token) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/api/logout'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to logout');
    }
  }
}
