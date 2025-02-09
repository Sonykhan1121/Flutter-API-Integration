import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String test="Testing....";

  Future<void> fetchData() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/todos/2');
    final response =await http.get(url);

    print('status : ${response.statusCode}');
    // print("api ${response.body}");
    final jsondata =jsonDecode(response.body);
    print('api  : ${jsondata.runtimeType}');
    setState(() {
      test = jsondata['title'];
    });

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ApI Integration'),
        backgroundColor: Colors.pink,
      ),
      body: Center(
        child: Text(
          test!,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
