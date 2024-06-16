class LoginForm {

final String email;
final String password;

LoginForm({required this.email,required this.password});

Map <String, dynamic> ToJson() {
  return {
    'email': email,
    'password': password,
  };
}

}