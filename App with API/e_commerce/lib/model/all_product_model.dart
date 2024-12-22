import 'dart:developer';

import 'package:e_commerce/model/product_image_mode.dart';

class AllProductModel {
  int? id;
  String? title;
  String? description;
  String? category;
  double? price;
  // double? rating;
  int? inStock;
  String? brand;
  String? warranty;
  String? returnPolicy;
  String? deliversIn;
  List<ProductImageModel>? listOfProductImage;

  AllProductModel(Map<String, dynamic> productJson) {
    log("IN ALL PRODUCT");
    id = productJson['id'];
    title = productJson['title'];
    description = productJson['description'];
    category = productJson['category'];
    price = productJson['price'];
    inStock = productJson['stock'];
    brand = productJson['brand'];
    warranty = productJson['warrantyInformation'];
    returnPolicy = productJson['returnPolicy'];
    deliversIn = productJson['shippingInformation'];

    listOfProductImage = [];
    if (productJson['images'] != null) {
      productJson['images'].forEach((mapObj1) {
        ProductImageModel localObj1 = ProductImageModel(mapObj1);

        listOfProductImage!.add(localObj1);
      });
    }
  }
}
