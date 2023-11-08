import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class Service {
  Future<http.Response> saveUser(
      String nome, String email, String telefone) async {
    var uri = Uri.parse("192.168.0.4:8080/usuario/cadastrar");
    //header
    Map<String, String> headers = {"Content-Type": "application/json"};
    //body
    Map data = {'nome': '$nome', 'email': '$email', 'telefone': '$telefone'};

    //dados para json
    var body = jsonEncode(data);
    var respose = await http.post(uri, headers: headers, body: body);
    print("${respose.body}");
    return respose;
  }
}
