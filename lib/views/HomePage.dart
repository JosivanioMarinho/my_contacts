import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:meus_contatos/controllers/SaveContactController.dart';
import 'package:meus_contatos/models/Contact.dart';
import 'package:meus_contatos/widgets/CustomAppBar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerPhone = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  var _scafoldKey = GlobalKey<ScaffoldState>();
  String _idUserLoged;
  Firestore _dataBase = Firestore.instance;
  Contact _contact = Contact();

  _idUserFirebase() async {

    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseUser user = await auth.currentUser();
    setState(() {
      _idUserLoged = user.uid;
    });
  }

  @override
  void initState() {
    super.initState();
    _idUserFirebase();
  }

  @override
  Widget build(BuildContext context) {

    var stream = StreamBuilder(
      stream: _dataBase.collection(_idUserLoged)
      .orderBy("name")
      .snapshots(),
      builder: (context, snapshot){
        switch(snapshot.connectionState){
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );
            break;
          case ConnectionState.active:
          case ConnectionState.done:

            QuerySnapshot querySnapshot = snapshot.data;

            if( snapshot.hasError ){
              return Text("Error loading contacts, try later");
            }else{

              return Expanded(
                child: ListView.builder(
                  itemCount: querySnapshot.documents.length,
                  itemBuilder: (context, index){
          
                    List<DocumentSnapshot> contacts = querySnapshot.documents.toList();
                    DocumentSnapshot item = contacts[index];
                    String idContact = item.documentID;
                     
                    String title = item["name"];
                    String letter = title[0].toUpperCase();
                    String phone = item["phoneNumber"];
                    String email = item["email"];
                    String key = DateTime.now().microsecondsSinceEpoch.toString();

                    return Dismissible(
                      direction: DismissDirection.endToStart,
                      key: Key(key),
                      onDismissed: (direction) async{
                      
                        _dataBase.collection(_idUserLoged).document(idContact).delete();

                        final snackbar = SnackBar(
                        content: Text("Deleted!", 
                        style: TextStyle(fontSize: 16),));
                        _scafoldKey.currentState.showSnackBar(snackbar);
                      },
                      background: Container(
                        color: Colors.red,
                        padding: EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[Icon(Icons.delete, color: Colors.white,),],
                        ),
                      ),
                      child: ListTile(
                        contentPadding: EdgeInsets.only(left: 16 ,top: 10, right: 16),
                        leading: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 25,
                          child: Text(
                            letter,
                            style: TextStyle(color: Colors.grey[900], fontSize: 18),
                          ),
                        ),
                        title: Text(
                          title,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                          ),
                        ),
                        onTap: (){
                          showDialog(
                            context: context,
                            builder: (context){

                              return AlertDialog(
                                title: Text(title),
                                content: SingleChildScrollView(
                                    child: Container(
                                      height: 120,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          //Informations
                                          Text("Phone: ${phone}", 
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          Text("E-mail: ${email}",
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                actions: <Widget>[
                                  FlatButton(
                                    onPressed: ()=> Navigator.pop(context), 
                                    child: Text("Close"),
                                  ),
                                ],
                              );
                            }
                          );
                        },
                      ),
                    );
                  }
                ),
              );
            }
            break;
        }
      } 
    );

    return Scaffold(
      key: _scafoldKey,
      backgroundColor: Color(0xff457B9D),
      body: Container(
        child: SafeArea(
          child: Container(
            child: Column(
              children: <Widget>[
                CustomAppBar(),
                stream,
              ],
            ),
          )
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.person_add,
          color: Colors.white,
        ),
        backgroundColor: Color(0xff1D3557),
        onPressed: (){
          showDialog(
            context: context,
            builder: (context){

              return AlertDialog(
                title: Text("Add contact"),
                content: SingleChildScrollView(
                    child: Container(
                      height: 200,
                      child: Column(
                        children: <Widget>[
                          TextField(
                            controller: _controllerName,
                            decoration: InputDecoration(
                              labelText: "Name"
                            ),
                          ),
                          TextField(
                            controller: _controllerPhone,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: "Phone number"
                            ),
                          ),
                          TextField(
                            controller: _controllerEmail,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: "E-mail"
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                actions: <Widget>[
                  FlatButton(
                    onPressed: ()=> Navigator.pop(context), 
                    child: Text("Cancel"),
                  ),
                  FlatButton(
                    onPressed: () async {

                      String idContact =  DateTime.now().microsecondsSinceEpoch.toString();
                      
                      _contact.idUser      = _idUserLoged;
                      _contact.idContact   =  idContact;
                      _contact.name        = _controllerName.text;
                      _contact.phoneNumber = _controllerPhone.text;
                      _contact.email       = _controllerEmail.text;

                      //Save contact!
                      SaveContactController.saveContact( _contact );

                      _controllerName.text = "";
                      _controllerPhone.text = "";
                      _controllerEmail.text = "";

                      final snackbar = SnackBar(
                        duration: Duration(seconds: 3),
                        content: Text(SaveContactController.MESSAGE, 
                        style: TextStyle(fontSize: 16),));
                      _scafoldKey.currentState.showSnackBar(snackbar);

                      Navigator.pop(context);
                    }, 
                    child: Text("Save"),
                  ),
                ],
              );
            }
          );
        },
      ),
    );
  }
}