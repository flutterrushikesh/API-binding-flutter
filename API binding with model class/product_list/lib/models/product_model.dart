import 'package:product_list/models/product_detail_model.dart';

class ProductModel {
  int? total;
  int? limit;
  List<ProductDetailsModel>? productDetails;

  ProductModel(Map<String, dynamic> json) {
    total = json["total"];
    limit = json["limit"];

    productDetails = [];
    if (json["products"] != null) {
      json["products"].forEach((mapObj) {
        ProductDetailsModel obj = ProductDetailsModel(mapObj);
        productDetails!.add(obj);
      });
    }
  }
}
