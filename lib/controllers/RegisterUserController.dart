import 'package:firebase_auth/firebase_auth.dart';
import 'package:meus_contatos/models/User.dart';
import 'package:flutter/material.dart';
import 'package:meus_contatos/views/HomePage.dart';

class RegisterUserController{

  registerUser(User user, BuildContext context){

    FirebaseAuth auth = FirebaseAuth.instance;

    auth.createUserWithEmailAndPassword(
      email: user.email, 
      password: user.password,
    ).then((firebaseUser) {

      Navigator.push(
        context, 
        MaterialPageRoute(builder: (_) => HomePage())
      );
    })/*.catchError((error){

    })*/;
  }

}