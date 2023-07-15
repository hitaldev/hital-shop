import 'package:hital_shop/backend/models/product.dart';

class CartResponse {
  int? totalItems;
  String? price;
  String? discountPrice;
  String? totalPrice;
  List<Items>? items;

  CartResponse(
      {this.totalItems,
        this.price,
        this.discountPrice,
        this.totalPrice,
        this.items});

  CartResponse.fromJson(Map<String, dynamic> json) {
    totalItems = json['total_items'];
    price = json['price'];
    discountPrice = json['discount_price'];
    totalPrice = json['total_price'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_items'] = this.totalItems;
    data['price'] = this.price;
    data['discount_price'] = this.discountPrice;
    data['total_price'] = this.totalPrice;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  int? count;
  Product? product;

  Items({this.count, this.product});

  Items.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    product =
    json['product'] != null ? new Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    return data;
  }
}
