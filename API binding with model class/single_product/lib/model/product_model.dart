class ProductModel {
  String? title;
  String? description;
  String? category;
  double? price;

  ProductModel(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    category = json['category'];
    price = json['price'];
  }
}
