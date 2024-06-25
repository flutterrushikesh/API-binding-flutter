import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:single_product/controller/api_binding_controller.dart';
import 'package:single_product/model/product_model.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State createState() => _MainScreen();
}

class _MainScreen extends State {
  ProductModel? productModelfillObj;

  @override
  void initState() {
    getProductDetailsLocally();
    super.initState();
  }

  void getProductDetailsLocally() async {
    ProductModel localObj = await getProductDetails();
    productModelfillObj = localObj;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "API single product",
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: validateObj(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {
            getProductDetailsLocally();
          });
        },
        label: const Text("Show Data"),
      ),
    );
  }

  Widget validateObj() {
    if (productModelfillObj != null) {
      return Container(
        height: 170,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 225, 223, 223),
              blurRadius: 16,
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${productModelfillObj?.title!}",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "${productModelfillObj?.description!}",
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${productModelfillObj?.category!}",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "₹ ${productModelfillObj?.price!}",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    } else {
      return const Center(
        child: Text("No data available"),
      );
    }
  }
}
