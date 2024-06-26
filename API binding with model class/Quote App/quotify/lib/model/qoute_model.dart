import 'package:quotify/model/single_quote_model.dart';

class QuoteModel {
  List<SingleQuotsModel>? singleQuotsModelObjList;

  QuoteModel(Map<String, dynamic> json) {
    singleQuotsModelObjList = [];

    if (json["quotes"] != null) {
      json["quotes"].forEach((mapObj) {
        SingleQuotsModel obj = SingleQuotsModel(mapObj);
        singleQuotsModelObjList!.add(obj);
      });
    }
  }
}
