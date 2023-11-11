import 'package:crud_flutter/app/pages/register/register_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
    @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      title: "Flutter Demo",
      home: RegisterPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
