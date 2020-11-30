import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:meus_contatos/models/Contact.dart';

class SaveContactController {

  static String MESSAGE = "Saved";

  static saveContact( Contact contact ) {

    String name = contact.name;
    String idUser = contact.idUser;

    if( name.isNotEmpty && idUser.isNotEmpty ) { 

      Firestore dataBase = Firestore.instance;
      dataBase.collection(idUser)
      .add(contact.toMap());
    }else{
      MESSAGE = "Fill up the name field!";
    }
  }
}