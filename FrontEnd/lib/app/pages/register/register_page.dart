import 'package:crud_flutter/app/http/http_client.dart';
import 'package:crud_flutter/app/model/user_model.dart';
import 'package:crud_flutter/app/pages/register/listagem_users.dart';
import 'package:crud_flutter/app/repositories/user_repository.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<StatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final UsuarioRepository repository = UsuarioRepository(client: HttpClient());
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController telefoneController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(5),
        child: FractionallySizedBox(
          widthFactor: 0.9,
          heightFactor: 0.9,
          child: ListView(
            children: [
              const Text('Nome'),
              const SizedBox(height: 5),
              TextField(
                controller: nomeController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Justin Case'),
              ),
              const Text('Email'),
              const SizedBox(height: 5),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'justincase@gmail.com'),
              ),
              const Text('Telefone'),
              const SizedBox(height: 5),
              TextField(
                controller: telefoneController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '555-555-555'),
              ),
              ElevatedButton(
                  onPressed: () {
                    Usuario user = Usuario(
                        nome: nomeController.text,
                        email: emailController.text,
                        telefone: telefoneController.text);
                    repository.postUser(user);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const ListaUser()));
                  },
                  child: const Text('Cadastrar-se')),
            ],
          ),
        ),
      ),
    );
  }
}
