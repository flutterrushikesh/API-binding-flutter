import 'package:ccarts_example/models/product_model.dart';

class MultipleCartsModel {
  List<ProductsModel>? productsModelObjlist;
  double? total;
  double? alldiscountTotal;
  int? userId;
  int? totalProducts;
  int? totalQuantity;

  MultipleCartsModel(Map<String, dynamic> json) {
    // log("$json");
    total = json["total"];
    alldiscountTotal = json["discountedTotal"];
    userId = json["userId"];
    totalProducts = json["totalProducts"];
    totalQuantity = json["totalQuantity"];

    productsModelObjlist = [];

    if (json["products"] != null) {
      json["products"].forEach((mapObj) {
        ProductsModel obj = ProductsModel(mapObj);
        productsModelObjlist!.add(obj);
      });
    }
  }
}
