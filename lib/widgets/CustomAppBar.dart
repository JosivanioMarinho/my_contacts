import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final double widthAppBar = MediaQuery.of(context).size.width;
    final double heightAppBar = AppBar().preferredSize.height;

    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 8, right: 8, top: 8),
        child: Container(
          height: heightAppBar,
          width: widthAppBar,
          decoration: BoxDecoration(
            color: Color(0xff1D3557),
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            )
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all( 16 ),
                  child: Text(
                    "My contacts",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.search, color: Colors.white,), 
                onPressed:(){},
              )
            ],
          ),
        ),
      ),
    );
  }
}