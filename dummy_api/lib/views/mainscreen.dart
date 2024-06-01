import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State createState() => _MainScreenState();
}

class _MainScreenState extends State {
  List<Map<String, dynamic>> empData = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("API bindind"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
          itemCount: empData.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                child: Row(
                  children: [
                    Text("Name: ${empData[index]['employee_name']}"),
                    const SizedBox(
                      width: 8,
                    ),
                    Text("Salary: ${empData[index]['employee_salary']}"),
                    const SizedBox(
                      width: 8,
                    ),
                    Text("Age: ${empData[index]['employee_age']}"),
                    const SizedBox(
                      width: 8,
                    ),
                    Text("Id: ${empData[index]['id']}")
                  ],
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: getEmpData,
        label: const Text(
          "Show data",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  void getEmpData() async {
    Uri url = Uri.parse('	https://dummy.restapiexample.com/api/v1/employees');

    http.Response response = await http.get(url);
    log(response.body);

    var responseData = jsonDecode(response.body);

    setState(() {
      empData = responseData['data'];
    });
  }
}
