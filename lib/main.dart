import 'package:flutter/material.dart';
import 'package:meus_contatos/views/LoginPage.dart';
import 'package:meus_contatos/views/RegisterPage.dart';

void main() => runApp(
  MaterialApp(
    home: LoginPage(),
    theme: ThemeData(
      accentColor: Color(0xff457B9D),
    ),
    debugShowCheckedModeBanner: false,
  )
);