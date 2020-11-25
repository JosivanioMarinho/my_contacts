import 'package:flutter/material.dart';
import 'package:meus_contatos/controllers/LoginUserController.dart';
import 'package:meus_contatos/models/User.dart';
import 'package:meus_contatos/views/RegisterPage.dart';
import 'package:meus_contatos/widgets/CustomTextField.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();
  LoginUserController _loginUser = LoginUserController();
  String _errorMessage = "";

  _validateFields(){
    
    String email = _controllerEmail.text;
    String password = _controllerPassword.text;

    if( email.isNotEmpty && email.contains("@") ){

        if( password.isNotEmpty ){

          setState(() {
            _errorMessage = "";
          });

          //CRegister user
          User user = User();
          user.email = email;
          user.password = password;

          //User login
          _loginUser.loginUser(user, context);

          //Error message
          setState(() {
            _errorMessage = _loginUser.errorMessage();
          });

        }else{
          setState(() {
            _errorMessage = "Fill up the password!";
          });
        }
      }else{
        setState(() {
          _errorMessage = "Invalid e-mail!";
        });
      }
  }

  @override
  void initState() {
    _loginUser.checkLogin(context);
    super.initState();
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
                  "Login",
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
                          "images/rocket.png",
                          width: 70,
                          height: 70,
                        ),
                      ),
                      CustomTextField(
                        controllerEmail: _controllerEmail,
                        hint: "E-mail", 
                        icon: Icon(
                          Icons.email,
                          color: Color(0xff1D3557),
                        ),
                      ),
                      CustomTextField(
                        controllerPassword: _controllerPassword,
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
                              "Sign in",
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Don't have an account, ",
                              style: TextStyle(
                                color: Color(0xff1D3557),
                                fontSize: 16,
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                                Navigator.push(
                                  context, 
                                  MaterialPageRoute(builder: (_)=> RegisterPage())
                                );
                              },
                              child: Text(
                                "register",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
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