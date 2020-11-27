import "package:flutter/material.dart";
import 'package:meus_contatos/widgets/CustomAppBar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

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

  @override
  Widget build(BuildContext context) {

    var listContacts = Expanded(
      child: ListView.builder(
        itemCount: contatcList.length,
        itemBuilder: (context, index){
          
          String title = contatcList[index];

          return ListTile(
            contentPadding: EdgeInsets.only(left: 16 ,top: 10, right: 16),
            leading: Image.asset("images/042-solar-system.png", width: 60,),
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
                      height: 120,
                      child: Column(
                        children: <Widget>[
                          TextField(
                            //controller: ,
                            decoration: InputDecoration(
                              labelText: "Name"
                            ),
                          ),
                          TextField(
                            //controller: ,
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
                    onPressed: (){

                      //Save contact!

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