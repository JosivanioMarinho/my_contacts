import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:meus_contatos/models/Contact.dart';

class SaveContactController {

  static String MESSAGE = "Saved";

  static saveContact( Contact contact ) {

    String name = contact.name;
    String idUser = contact.idUser;

    if( name.isNotEmpty && idUser.isNotEmpty ) { 

      String idContatc = DateTime.now().microsecondsSinceEpoch.toString();

      Firestore dataBase = Firestore.instance;
      dataBase.collection("contacts")
      .document(idUser)
      .collection(idContatc)
      .add(contact.toMap());
    }else{
      MESSAGE = "Fill up the name field!";
    }
  }
}