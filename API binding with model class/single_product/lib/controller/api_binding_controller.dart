import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:single_product/model/product_model.dart';

Future<ProductModel> getProductDetails() async {
  log("in APi Binding");
  ProductModel? productModelObj;
  bool validateRequest = false;

  if (validateRequest == false) {
    log('request hited');
    Uri url = Uri.parse('https://dummyjson.com/products/2');

    http.Response response = await http.get(url);

    var responseData = json.decode(response.body);
    // log(response.body);

    productModelObj = ProductModel(responseData);

    validateRequest = true;
  }

  // log('$productModelObj');
  return productModelObj!;
}
