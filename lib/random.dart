import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class randomdata extends StatefulWidget {
  const randomdata({super.key});

  @override
  State<randomdata> createState() => _randomdataState();
}

class _randomdataState extends State<randomdata> {
  final url = Uri.parse("https://randomuser.me/api/?results=30");
  List data = [];
  var isLoading = true;

  @override
  void initState() {
    super.initState();
    isLoading = true;
    getdata();
  }

  getdata() async {
    var response = await http.get(url);
    //print(response.body);
    setState(() {
      var convertdata = jsonDecode(response.body)["results"];
      data = convertdata;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Random data"),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: isLoading
              ? CircularProgressIndicator()
              : ListView.builder(
                  itemCount: data.length == null ? 0 : data.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        leading:
                            Image.network(data[index]["picture"]["thumbnail"]),
                        title: Text("${data[index]["name"]["first"]} " +
                            "${data[index]["name"]["last"]}"),
                        subtitle: Column(
                          children: [
                            Row(
                              children: [
                                Icon(Icons.phone),
                                SizedBox(
                                  width: 20,
                                ),
                                Text("${data[index]["phone"]}"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
