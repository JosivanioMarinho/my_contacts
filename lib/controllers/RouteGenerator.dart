import 'package:flutter/material.dart';
import 'package:meus_contatos/views/HomePage.dart';
import 'package:meus_contatos/views/LoginPage.dart';
import 'package:meus_contatos/views/RegisterPage.dart';

class RouteGenerator{

  static const String HOME_ROUTE = "/home";
  static const String LOGIN_ROUTE = "/loginPage";
  static const String REGISTER_ROUTE = "/registerPage";

  static Route<dynamic> generateRoute(RouteSettings settings){

    switch( settings.name ){
      case "/":
        return MaterialPageRoute(
          builder: (_) => LoginPage()
        );
      case LOGIN_ROUTE:
        return MaterialPageRoute(
          builder: (_) => LoginPage()
        );
      case REGISTER_ROUTE:
        return MaterialPageRoute(
          builder: (_) => RegisterPage()
        );
      case HOME_ROUTE:
        return MaterialPageRoute(
          builder: (_) => HomePage()
        );
      default :
        _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute(){
    return MaterialPageRoute(
      builder: (_){
        return Scaffold(
          appBar: AppBar(
            title: Text("Page not found"),
          ),
          body: Center(
            child: Container(
              child: Text("Page not found"),
            ),
          ),
        );
      }
    );
  }
}