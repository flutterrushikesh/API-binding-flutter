import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:product_list/models/product_detail_model.dart';
import 'package:product_list/models/product_model.dart';

Future<List> getProductData() async {
  log("In Api function");
  Uri url = Uri.parse('https://dummyjson.com/products');

  http.Response response = await http.get(url);
  // log(response.body);
  var responseData = json.decode(response.body);
  // log('$responseData');

  ProductModel productModelObj = ProductModel(responseData);
  // log("$responseData");

  List<ProductDetailsModel> productModelList = productModelObj.productDetails!;

  // log("IN API $productModelList");
  return productModelList;
}
