import 'dart:convert';
import 'package:http/http.dart';

class AuthRepository {
  String userUrl = 'https://api.mail.tm/token';

  Future login(String email,String password) async {

    Response response = await post(
      Uri.parse(userUrl),
      body: jsonEncode({'address': email, 'password': password}),
      headers: {
        'Content-Type': 'application/json',
        'accept': 'application/json'
      },
    );




    if (response.statusCode == 200) {
        final result=json.decode(response.body);
      return result['token'];
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}