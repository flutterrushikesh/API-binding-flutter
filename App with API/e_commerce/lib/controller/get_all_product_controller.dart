import 'dart:convert';
import 'package:e_commerce/model/get_all_product_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetAllProductController extends ChangeNotifier {
  Future<List> getAllProducts() async {
    Uri url = Uri.parse('https://dummyjson.com/products');

    http.Response response = await http.get(url);
    Map<String, dynamic> jsonData = json.decode(response.body);

    GetAllProductModel productModelObj = GetAllProductModel(jsonData);
    return productModelObj.listOfProducts!;
  }

  @override
  notifyListeners();
}
