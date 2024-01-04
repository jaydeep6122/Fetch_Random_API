// ignore_for_file: must_be_immutable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  String title;
  MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var url = Uri.parse('https://api.github.com/users');
  List data = [];
  var isLoading = false;
  @override
  void initState() {
    super.initState();
    getjsondata();
  }

  getjsondata() async {
    var response = await http.get(url);

    setState(() {
      var convertdatatojson = json.decode(response.body);

      data = convertdatatojson;
      print(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("${widget.title}"),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (BuildContext, index) {
            return Card(
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text("${data[index]["login"]}"),
                    subtitle: Text("${data[index]["id"]}"),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
