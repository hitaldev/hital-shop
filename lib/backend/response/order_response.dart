import 'package:hital_shop/backend/models/product.dart';

class OrderResponse {
  List<Order>? data;

  OrderResponse({this.data});

  OrderResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Order>[];
      json['data'].forEach((v) {
        data!.add(new Order.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Order {
  String? trackingCode;
  String? totalPrice;
  String? status;
  String? address;
  List<Product>? products;

  Order(
      {this.trackingCode,
        this.totalPrice,
        this.status,
        this.address,
        this.products});

  Order.fromJson(Map<String, dynamic> json) {
    trackingCode = json['tracking_code'];
    totalPrice = json['total_price'];
    status = json['status'];
    address = json['address'];
    if (json['products'] != null) {
      products = <Product>[];
      json['products'].forEach((v) {
        products!.add(new Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tracking_code'] = this.trackingCode;
    data['total_price'] = this.totalPrice;
    data['status'] = this.status;
    data['address'] = this.address;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
