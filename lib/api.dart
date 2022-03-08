import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api extends StatefulWidget {
  const Api({Key? key}) : super(key: key);

  @override
  _ApiState createState() => _ApiState();
}

class _ApiState extends State<Api> {
  late String getData;

  Future fetchData() async{
    http.Response response;
    response = await http.get(Uri.parse("https://www.thegrowingdeveloper.org/apiview?id=2"));

    if(response.statusCode==200){
      setState(() {
        getData = response.body;
      });
    }else{
      if(response.statusCode==400){
        setState(() {
          getData.isEmpty;
        });
      }
    }
  }
  @override
  void initState(){
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API"),
      ),
      body: Center(
        child: Text(getData.toString(),
        style: TextStyle(
          color: Colors.white,
          fontSize: 22
        ),
        ),
      ),
    );
  }
}
