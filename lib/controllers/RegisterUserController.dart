import 'package:firebase_auth/firebase_auth.dart';
import 'package:meus_contatos/controllers/RouteGenerator.dart';
import 'package:meus_contatos/models/User.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterUserController{

  registerUser(User user, BuildContext context){

    FirebaseAuth auth = FirebaseAuth.instance;

    auth.createUserWithEmailAndPassword(
      email: user.email, 
      password: user.password,
    ).then((firebaseUser) {

      //Salve user data
      Firestore dataBase = Firestore.instance;

      dataBase.collection("users")
      .document( firebaseUser.uid )
      .setData( user.toMap() );

      Navigator.pushNamedAndRemoveUntil(
        context, 
        RouteGenerator.HOME_ROUTE, 
        (_) => false
      );
    })/*.catchError((error){

    })*/;
  }

}