import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'api1.dart';

class Api extends StatefulWidget {
  const Api({Key? key}) : super(key: key);

  @override
  _ApiState createState() => _ApiState();
}

class _ApiState extends State<Api> {
  //late String getData = " ";
  List getList = [];

  Future fetchData() async {
    http.Response response;
    response = await http
        .get(Uri.parse("https://www.thegrowingdeveloper.org/apiview?id=4"));

    if (response.statusCode == 200) {
      //List jn = ["ijyhu"];
      setState(() {
        //print(response.body.toString());
        //getList = jn;
        getList = json.decode(response
            .body); //List.from(response.body);//[...response.body as List];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("API"),
        ),
      ),
      body: ListView.builder(
        itemCount: getList == null ? 0 : getList.length,
        // itemCount: getList.isEmpty ? 0 : getList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Card(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              title: Text(
                                getList[index].toString(),
                              ),
                              actions: [
                                FlatButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const API1()),
                                    );
                                  },
                                  child: Text("okay"),
                                ),
                              ],
                              //title: Text("The"),
                            ),
                          );
                        });
                      },
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            getList[index].toString(),
                            //getList[0].toString(),
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      // body: Center(
      //   child: Text(
      //     getList.toString(),
      //     style: TextStyle(color: Colors.white, fontSize: 22),
      //   ),
      // ),
    );
  }
}
