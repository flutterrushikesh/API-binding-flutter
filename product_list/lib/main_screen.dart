import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List productData = [];

  @override
  @override
  void initState() {
    getEmployeeData();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Single data API"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: productData.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productData[index]['title'],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(productData[index]['description'])
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void getEmployeeData() async {
    Uri url = Uri.parse(
      'https://dummyjson.com/products',
    );

    http.Response response = await http.get(url);
    // log(response.body);

    var responseData = json.decode(response.body);
    log("$responseData");

    setState(() {
      productData = responseData['products'];
    });
  }
}
