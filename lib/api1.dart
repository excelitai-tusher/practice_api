import 'package:flutter/material.dart';

class API1 extends StatefulWidget {
  const API1({Key? key}) : super(key: key);

  @override
  _API1State createState() => _API1State();
}

class _API1State extends State<API1> {
  //List getList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "the",
      //getList[0].toString(),
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
      ),
    );
  }
}
