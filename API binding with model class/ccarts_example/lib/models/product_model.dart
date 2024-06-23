class ProductsModel {
  String? title;
  double? price;
  double? total;
  int? quantity;
  // double? discountPercentage;
  double? discountTotal;
  String? thumbnail;

  ProductsModel(Map<String, dynamic> json) {
    title = json["title"];
    price = json["price"];
    quantity = json["quantity"];
    total = json["total"];
    // discountPercentage = json["discountPercentage"];
    discountTotal = json["discountedTotal"];
    thumbnail = json["thumbnail"];
  }
}
