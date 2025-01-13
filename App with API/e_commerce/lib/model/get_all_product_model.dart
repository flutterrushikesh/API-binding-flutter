import 'package:e_commerce/model/all_product_model.dart';

class GetAllProductModel {
  List<AllProductModel>? listOfProducts;

  GetAllProductModel(Map<String, dynamic> json) {
    listOfProducts = [];

    if (json['products'] != null) {
      json['products'].forEach(
        (mapObj) {
          AllProductModel localObj = AllProductModel(mapObj);
          listOfProducts!.add(localObj);
        },
      );
    }
  }
}
