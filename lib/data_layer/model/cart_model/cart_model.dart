class CartItemModel {
  late int productId;
  late String productImage;
  late String productTitle;
  late double productPrice;

  CartItemModel({
    required this.productId,
    required this.productImage,
    required this.productTitle,
    required this.productPrice,
  });

  CartItemModel.fromJson(Map<String, dynamic> json) {
    productId = json["productId"];
    productImage = json["productImage"];
    productTitle = json["productName"];
    productPrice = json["productPrice"].toDouble();
  }

  Map<String, dynamic> toCacheJson() {
    return {
      "productId": productId,
      "productImage": productImage,
      "productName": productTitle,
      "productPrice": productPrice,
    };
  }

  Map<String, dynamic> toServerJson() {
    return { "productId": productId,
      "productImage": productImage,
      "productName": productTitle,
      "productPrice": productPrice,};
  }
}
