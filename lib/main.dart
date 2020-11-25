import 'package:flutter/material.dart';
import 'package:meus_contatos/controllers/RouteGenerator.dart';
import 'package:meus_contatos/views/LoginPage.dart';
import 'package:meus_contatos/views/RegisterPage.dart';

void main() => runApp(
  MaterialApp(
    home: LoginPage(),
    theme: ThemeData(
      primaryColor: Color(0xff1D3557),
      accentColor: Color(0xff457B9D),
    ),
    initialRoute: "/",
    onGenerateRoute: RouteGenerator.generateRoute,
    debugShowCheckedModeBanner: false,
  )
);