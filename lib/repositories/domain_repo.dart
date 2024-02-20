
import 'dart:convert';
import 'package:http/http.dart';
import 'package:qtec_tem_mail/Model/domain_model.dart';

class DomainRepository {
  String userUrl = 'https://api.mail.tm/domains?page=1';

  Future<DomainModel> getDomain() async {
    Response response = await get(Uri.parse(userUrl));
    if (response.statusCode == 200) {
      final  result = jsonDecode(response.body)['hydra:member'][0];
      final DomainModel model=DomainModel.fromJson(result);
      return model;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}