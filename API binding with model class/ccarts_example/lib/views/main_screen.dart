import 'dart:convert';
import 'dart:developer';

import 'package:ccarts_example/models/cart_model.dart';
import 'package:ccarts_example/models/multiplecarts_model.dart';
import 'package:ccarts_example/views/history_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State createState() => _MainScreenState();
}

class _MainScreenState extends State {
  List<MultipleCartsModel> cartModelObjList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Cart',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const HistoryScreen();
                  },
                ),
              );
            },
            icon: const Icon(Icons.history),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: cartModelObjList.length,
        itemBuilder: (context, index) {
          return Container(
            child: Column(
              children: [
                Text("${cartModelObjList[index].totalProducts}"),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  void initState() {
    getCartData();
    super.initState();
  }

  void getCartData() async {
    Uri url = Uri.parse('https://dummyjson.com/carts');

    http.Response response = await http.get(url);
    // log(response.body);

    var responseJson = json.decode(response.body);

    CartModel cartModelobj = CartModel(responseJson);
    setState(() {
      cartModelObjList = cartModelobj.multipleCartsModellist!;
      log('$cartModelObjList');
    });
  }
}
