class ProductDetailsModel {
  String? title;
  String? description;
  String? category;
  double? price;

  ProductDetailsModel(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    category = json["category"];
    price = json["price"];
  }
}
