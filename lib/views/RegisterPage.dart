import 'package:flutter/material.dart';
import 'package:meus_contatos/widgets/CustomTextField.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Color(0xff1D3557)),
        padding: EdgeInsets.all(16),
        child: Center(
          child:SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Register",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                ),
                SizedBox(height: 30,),
                Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Color(0xff457B9D),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 20),
                        child: Image.asset(
                          "images/astronaut.png",
                          width: 70,
                          height: 70,
                        ),
                      ),
                      CustomTextField(hint: "User name",),
                      CustomTextField(
                        hint: "E-mail", 
                        icon: Icon(
                          Icons.email,
                          color: Color(0xff1D3557),
                        ),
                      ),
                      CustomTextField(
                        hint: "Password", 
                        obscure: true,
                        icon: Icon(
                          Icons.lock,
                          color: Color(0xff1D3557),
                        ),
                      ),
                      SizedBox(height: 20,),
                      InkWell(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                              colors: [
                                Color(0xffE63946),
                                Color(0xffEB5C68),
                              ]
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "Sign up",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                              ),
                            ),
                          ),
                        ),
                        onTap: (){},
                      ),
                      SizedBox(height: 10,),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}