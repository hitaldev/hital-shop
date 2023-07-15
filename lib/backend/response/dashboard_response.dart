import 'package:hital_shop/backend/models/category.dart';
import 'package:hital_shop/backend/models/product.dart';

class DashboardResponse {
  List<String>? sliders;
  List<Category>? categories;
  List<Product>? discountedProducts;
  List<Product>? latestProducts;

  DashboardResponse(
      {this.sliders,
        this.categories,
        this.discountedProducts,
        this.latestProducts});

  DashboardResponse.fromJson(Map<String, dynamic> json) {
    sliders = json['sliders'].cast<String>();
    if (json['categories'] != null) {
      categories = <Category>[];
      json['categories'].forEach((v) {
        categories!.add(new Category.fromJson(v));
      });
    }
    if (json['discounted_products'] != null) {
      discountedProducts = <Product>[];
      json['discounted_products'].forEach((v) {
        discountedProducts!.add(new Product.fromJson(v));
      });
    }
    if (json['latest_products'] != null) {
      latestProducts = <Product>[];
      json['latest_products'].forEach((v) {
        latestProducts!.add(new Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sliders'] = this.sliders;
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    if (this.discountedProducts != null) {
      data['discounted_products'] =
          this.discountedProducts!.map((v) => v.toJson()).toList();
    }
    if (this.latestProducts != null) {
      data['latest_products'] =
          this.latestProducts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}



