import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {

  final String hint;
  final bool obscure;
  final Icon icon;

  TextEditingController controllerName;
  TextEditingController controllerEmail;
  TextEditingController controllerPassword;

  CustomTextField({
      @required this.hint,
      this.obscure=false,
      this.icon= const Icon(Icons.person, color: Color(0xff1D3557),),
      this.controllerName,
      this.controllerEmail,
      this.controllerPassword
      }
    );

  TextEditingController _getController(){

    if( this.hint == "E-mail" ){
      return this.controllerEmail;
    }
    if( this.hint == "Password" ){
      return this.controllerPassword;
    }

    return this.controllerName;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: TextField(
        controller: _getController(),
        obscureText: this.obscure,
        keyboardType: this.hint == "E-mail" 
          ? TextInputType.emailAddress 
          : TextInputType.text,
        style: TextStyle(
          color: Color(0xff1D3557),
          fontSize: 18,
        ),
        decoration: InputDecoration(
          hintText: this.hint,
          contentPadding: EdgeInsets.fromLTRB(8, 8, 8, 8),
          filled: true,
          fillColor: Color(0xffA8DADC),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 0),
          ),
          hintStyle: TextStyle(
            color: Color(0xff1D3557),
            fontSize: 18,
          ),
          prefixIcon: this.icon,
        ),
      ),
    );
  }
}