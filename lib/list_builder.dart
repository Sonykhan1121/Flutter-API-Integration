import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ListBuilder extends StatefulWidget {
  const ListBuilder({super.key});

  @override
  State<ListBuilder> createState() => _ListBuilderState();
}

class _ListBuilderState extends State<ListBuilder> {
  late List<dynamic> list;

  Future<void> fetchData() async {
    final url =
        Uri.parse('http://universities.hipolabs.com/search?country=bangladesh');
    final response = await http.get(url);
    final data = jsonDecode(response.body) as List;


    setState(() {
      list = data;
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
        title: Text(
          'List Builder',
          style: TextStyle(color: Colors.orange),
        ),
      ),
      body:ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(list[index]['name']),
            subtitle: Text(list[index]['web_pages'][0]),
          );
        }
      ),
    );
  }
}
