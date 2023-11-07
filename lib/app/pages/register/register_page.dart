import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<StatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController telefoneController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(5),
        child: FractionallySizedBox(
          widthFactor: 0.9,
          heightFactor: 0.9,
          child: ListView(
            children: [
              Text('Nome'),
              SizedBox(height: 5),
              TextField(
                controller: nomeController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Justin Case'
                  ),
              ),
              Text('Email'),
              SizedBox(height: 5),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'justincase@gmail.com'
                  ),
              ),
              Text('Telefone'),
              SizedBox(height: 5),
              TextField(
                controller: telefoneController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '555-555-555'
                  ),
              ),
              ElevatedButton(onPressed: (){}, child: Text('Cadastrar-se')),
            ],
          ),
        ),
      ),
    );
  }
}
