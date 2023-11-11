import 'dart:convert';

import 'package:crud_flutter/app/http/exceptions.dart';
import 'package:crud_flutter/app/http/http_client.dart';
import 'package:crud_flutter/app/model/user_model.dart';
import 'package:http/http.dart';

abstract class IUsuarioRepository {
  Future<List<Usuario>> getUsers();
  Future<Response> postUser(Usuario user);
}

class UsuarioRepository implements IUsuarioRepository {
  final IHttpClient client;
  UsuarioRepository({required this.client});

  @override
  Future<List<Usuario>> getUsers() async {
    final response = await client.get(url: "http://192.168.0.4:8080/usuario");
    if (response.statusCode == 200) {
      final List<Usuario> users = [];

      final body = jsonDecode(response.body);
      body.map((item) {
        final Usuario user = Usuario.fromMap(item);
        users.add(user);
      }).toList();
      return users;
    } else if (response.statusCode == 404) {
      throw NotFoundException("A url informada não é válida");
    } else {
      throw NotFoundException("Não foi possível carregar os usuarios.");
    }
  }

  @override
  Future<Response> postUser(Usuario user) async {
    final uri = Uri.parse("http://192.168.0.4:8080/usuario");
    //header
    Map<String, String> headers = {"Content-Type": "application/json"};
    //dados no body
    Map data = {
      'nome': user.nome,
      'email': user.email,
      'telefone': user.telefone
    };
    //dados para json
    var body = jsonEncode(data);
    final respose = await client.post(url: uri, headers: headers, body: body);
    return respose;
  }
}
