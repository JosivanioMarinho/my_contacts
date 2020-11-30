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

  List<String> contatcList = [
    "João",
    "Maria",
    "Julia",
    "Pedro",
    "Carlinhos",
    "Paulo",
    "José",
    "Rafaela",
    "Juliana",
    "Miguel",
    "João Pedro",
    "Carlos",
    "Ricardo",
    "Etc",
  ];

  _idUserFirebase() async {

    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseUser user = await auth.currentUser();
    _idUserLoged = user.uid;
  }

  @override
  void initState() {
    super.initState();
    _idUserFirebase();
  }

  @override
  Widget build(BuildContext context) {

    var listContacts = Expanded(
      child: ListView.builder(
        itemCount: contatcList.length,
        itemBuilder: (context, index){
          
          String title = contatcList[index];
          String letter = title[0];

          return ListTile(
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
                            children: <Widget>[
                              //Informations
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
          );
        }
      ),
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
                listContacts,
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

                      Contact contact = Contact();
                      contact.idUser      = _idUserLoged;
                      contact.name        = _controllerName.text;
                      contact.phoneNumber = _controllerPhone.text;
                      contact.email       = _controllerEmail.text;

                      //Save contact!
                      SaveContactController.saveContact( contact );

                      _controllerName.text = "";
                      _controllerPhone.text = "";
                      _controllerEmail.text = "";

                      final snackbar = SnackBar(
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