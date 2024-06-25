import 'package:ccarts_example/models/multiplecarts_model.dart';

class CartModel {
  List<MultipleCartsModel>? multipleCartsModellist;

  CartModel(Map<String, dynamic> json) {
    multipleCartsModellist = [];
    if (json["carts"] != null) {
      json["carts"].forEach((mapObj) {
        MultipleCartsModel obj = MultipleCartsModel(mapObj);
        multipleCartsModellist!.add(obj);
      });
    }
  }
}
