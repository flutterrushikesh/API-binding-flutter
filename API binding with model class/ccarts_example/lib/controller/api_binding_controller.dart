import 'dart:convert';

import 'package:ccarts_example/models/cart_model.dart';
import 'package:ccarts_example/models/multiplecarts_model.dart';
import 'package:http/http.dart' as http;

Future<List<MultipleCartsModel>> getCartData() async {
  Uri url = Uri.parse('https://dummyjson.com/carts');

  http.Response response = await http.get(url);
  // log(response.body);

  var responseJson = json.decode(response.body);

  CartModel cartModelobj = CartModel(responseJson);

  List<MultipleCartsModel> cartModelObjList =
      cartModelobj.multipleCartsModellist!;

  return cartModelObjList;
}
