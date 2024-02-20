import 'dart:convert';

import 'package:http/http.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:qtec_tem_mail/Model/message_res_model.dart';
class MessageRepository{
  final messageUrl='https://api.mail.tm/messages?page=1';


  Future<List<MessageResponse>>  getMessage()async{
    final storage = new FlutterSecureStorage();
    final token=await storage.read(key: 'jwt');
//    await storage.write(key: 'jwt', value: message);
    Response response= await get(Uri.parse(messageUrl),
      headers: {
        'accept': 'application/json',
        'Authorization': 'Bearer $token'
      }
    );

    if(response.statusCode==200){
      return messageResponseFromJson(response.body);
    }else{
      throw Exception(response.reasonPhrase);
    }
  }

}