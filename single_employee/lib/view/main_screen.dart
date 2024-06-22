import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart ' as http;
import 'dart:developer';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State createState() => _MainAppState();
}

class _MainAppState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Single employee"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: getEmpData,
        label: const Text(
          "Show Data",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  void getEmpData() async {
    Uri url = Uri.parse('	https://dummy.restapiexample.com/api/v1/employee/1');

    http.Response response = await http.get(url);
    log("$response");

    var responseData = json.decode(response.body);
    log(response.body);

    setState(() {});
  }
}
