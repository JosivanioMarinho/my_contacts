import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String _email = "";

  Future _login() async {

    FirebaseAuth auth = FirebaseAuth.instance;

    FirebaseUser user = await auth.currentUser();
    setState(() {
      _email = user.email;
    });
  }

  @override
  void initState() {
    _login();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Container(
        child: Text(_email),
      ),
    );
  }
}