class RegisterForm {
final String name;
final String username;
final String email;
final String password;

RegisterForm({required this.name,required this.username,required this.email,required this.password});

Map <String, dynamic> ToJson() {
  return {
    'name': name,
    'username': username,
    'email': email,
    'password': password,
  };
}
}
