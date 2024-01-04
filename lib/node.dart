// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class nodedata extends StatefulWidget {
  const nodedata({super.key});

  @override
  State<nodedata> createState() => _nodedataState();
}

class _nodedataState extends State<nodedata> {
  final url = Uri.parse("http://127.0.1.1:2010/");
  List dataa = [];
  var isLoadingg = true;

  @override
  void initState() {
    super.initState();
    isLoadingg = true;
    getdatares();
  }

  getdatares() async {
    var responsee = await http.get(url);
    print("hello");
    // setState(() {
    //   var convertdata = jsonDecode(responsee.body);
    //   dataa = convertdata;
    //   isLoadingg = false;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("node data"),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: isLoadingg
              ? const CircularProgressIndicator()
              : ListView.builder(
                  itemCount: dataa.length == null ? 0 : dataa.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        leading: Image.network(
                            "https://t4.ftcdn.net/jpg/01/96/63/77/360_F_196637738_JddWJszm0zDOWFvldat1rOCEawn7q4rz.jpg"),
                        title: Text("${dataa[index]["name"]} " +
                            "${dataa[index]["name"]}"),
                        subtitle: Column(
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.phone),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text("${dataa[index]["phone"]}"),
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
