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
    final url = Uri.parse('http://universities.hipolabs.com/search?country=bangladesh');
    final response =await http.get(url);

    print('status : ${response.runtimeType}');
    // print("api ${response.body}");
    final jsondata =jsonDecode(response.body)  as List;
   setState(() {
     test = jsondata[0].toString();
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
