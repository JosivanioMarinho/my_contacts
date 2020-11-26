import "package:flutter/material.dart";
import 'package:meus_contatos/widgets/CustomAppBar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xff457B9D),
      body: Container(
        child: SafeArea(
          child: Container(
            child: Column(
              children: <Widget>[
                CustomAppBar(),
              ],
            ),
          )
        ),
      ),
    );
  }
}