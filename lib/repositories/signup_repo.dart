import 'dart:convert';
import 'package:http/http.dart';
import 'package:qtec_tem_mail/Model/domain_model.dart';
import 'package:qtec_tem_mail/bloc/auth/signup/signup_state.dart';

class SignUpRepository {
  String userUrl = 'https://api.mail.tm/accounts';

  Future signupTempMail(String email,String password) async {

    Response response = await post(
      Uri.parse(userUrl),
      body: jsonEncode({'address': email, 'password': password}),
      headers: {
        'Content-Type': 'application/json',
        'accept': 'application/json'
      },
    );

    if (response.statusCode == 201) {

    return 'User create successfully';
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}