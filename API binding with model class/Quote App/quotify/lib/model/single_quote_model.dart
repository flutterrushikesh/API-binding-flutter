import 'dart:developer';

class SingleQuotsModel {
  String? quote;
  String? author;

  SingleQuotsModel(Map<String, dynamic> json) {
    // log(" single json $json");
    quote = json['"quote"'];
    author = json["author"];
  }
}
