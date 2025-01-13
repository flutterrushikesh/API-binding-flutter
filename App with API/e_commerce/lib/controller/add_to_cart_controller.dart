import 'dart:developer';

import 'package:e_commerce/model/all_product_model.dart';
import 'package:flutter/material.dart';

class AddToCartController extends ChangeNotifier {
  List<AllProductModel> listOfCartProducts = [];
  double itemTotal = 0;

  void addToCart({required dynamic product}) {
    log("$product");
    itemTotal = itemTotal + product.price;
    listOfCartProducts.add(product);
    notifyListeners();
  }
}
