import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Single data API"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          getEmployeeData();
        },
        label: const Text("Show Data"),
      ),
    );
  }

  void getEmployeeData() async {
    Uri url = Uri.parse('	https://dummy.restapiexample.com/api/v1/employee/1');

    http.Response response = await http.get(url);
    log('$response');
  }
}