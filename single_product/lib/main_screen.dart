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
  Map productMap = {};
  @override
  void initState() {
    getProductData();
  }

  void getProductData() async {
    Uri url = Uri.parse('https://dummyjson.com/products/2');

    http.Response response = await http.get(url);
    // log(response.body);

    var responseData = json.decode(response.body);
    log('$responseData');
    setState(() {
      productMap = responseData;
    });
  }

  // Widget validateMap() {
  //   if (productMap.isNotEmpty) {
  //     return Container(
  //       padding: const EdgeInsets.all(15),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Text(
  //             productMap['title'],
  //             style: const TextStyle(
  //               fontSize: 18,
  //               fontWeight: FontWeight.w700,
  //             ),
  //           ),
  //           const SizedBox(
  //             height: 10,
  //           ),
  //           Text(
  //             productMap['description'],
  //             style: const TextStyle(
  //               fontSize: 15,
  //               fontWeight: FontWeight.w500,
  //             ),
  //           ),
  //           const SizedBox(
  //             height: 10,
  //           ),
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               Text(
  //                 productMap['category'],
  //                 style: const TextStyle(
  //                   fontSize: 15,
  //                   fontWeight: FontWeight.w500,
  //                 ),
  //               ),
  //               Text(
  //                 '₹ ${productMap['price']}',
  //                 style: const TextStyle(
  //                   fontSize: 15,
  //                   fontWeight: FontWeight.w500,
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ],
  //       ),
  //     );
  //   } else {
  //     return Center();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Single product API'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              productMap['title'],
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              productMap['description'],
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  productMap['category'],
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  '₹ ${productMap['price']}',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
