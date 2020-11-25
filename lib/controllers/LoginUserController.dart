import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meus_contatos/models/User.dart';
import 'package:meus_contatos/views/HomePage.dart';

class LoginUserController{

  String _errorMessage = "";

  loginUser(User user, BuildContext context){

    FirebaseAuth auth = FirebaseAuth.instance;

    auth.signInWithEmailAndPassword(
      email: user.email, 
      password: user.password
    ).then((firebaseUser) {

      Navigator.push(
        context, 
        MaterialPageRoute(builder: (_)=> HomePage())
      );
    }).catchError((error){

      _errorMessage = "Error when signing in, check the filds";
    });
  }

  errorMessage(){
    return _errorMessage;
  }

  Future checkLogin(BuildContext context) async {

    FirebaseAuth auth = FirebaseAuth.instance;
    auth.signOut();

    FirebaseUser user = await auth.currentUser();
    if( user != null ){
      Navigator.push(
        context, 
        MaterialPageRoute(builder: (_)=> HomePage())
      );
    }
  }
}