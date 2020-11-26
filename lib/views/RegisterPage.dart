import 'package:flutter/material.dart';
import 'package:meus_contatos/controllers/RegisterUserController.dart';
import 'package:meus_contatos/models/User.dart';
import 'package:meus_contatos/widgets/CustomTextField.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();

  String _errorMessage = "";

  _validateFields(){
    
    String name = _controllerName.text;
    String email = _controllerEmail.text;
    String password = _controllerPassword.text;

    if( name.isNotEmpty ){

      if( email.isNotEmpty && email.contains("@") ){

        if( password.isNotEmpty && password.length > 6){

          setState(() {
            _errorMessage = "";
          });

          //CRegister user
          User user = User();
          user.name = name;
          user.email = email;
          user.password = password;

          //Passes the user to the page restration class
          RegisterUserController registerUserController = RegisterUserController();
          registerUserController.registerUser(user, context);

        }else{
          setState(() {
            _errorMessage = "Fill up the password! Enter more than 6 characters";
          });
        }
      }else{
        setState(() {
          _errorMessage = "Invalid e-mail!";
        });
      }
    }else{
      setState(() {
        _errorMessage = "The name is empty!";
      });
    }
  }

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
                      CustomTextField(
                        hint: "User name",
                        controllerName: _controllerName,
                      ),
                      CustomTextField(
                        hint: "E-mail", 
                        icon: Icon(
                          Icons.email,
                          color: Color(0xff1D3557),
                        ),
                        controllerEmail: _controllerEmail,
                      ),
                      CustomTextField(
                        hint: "Password", 
                        obscure: true,
                        icon: Icon(
                          Icons.lock,
                          color: Color(0xff1D3557),
                        ),
                        controllerPassword: _controllerPassword,
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
                        onTap: (){
                          _validateFields();
                        },
                      ),
                      SizedBox(height: 10,),
                      Center(
                        child: Text(
                          _errorMessage, 
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
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