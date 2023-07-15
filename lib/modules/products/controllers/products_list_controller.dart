import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hital_shop/backend/models/category.dart';
import 'package:hital_shop/backend/models/product.dart';
import 'package:hital_shop/backend/repositories/product_repository.dart';

class ProductsListController extends GetxController {
  final int? categoryId;
  final Sort? defaultSort;

  List<Category>? categories;
  List<Product>? products;
  ProductRepository repository = ProductRepository();
  TextEditingController txtSearch = TextEditingController();

  int? selectedCategoryId;
  Sort? selectedSort;

  ProductsListController({this.categoryId, this.defaultSort});

  Future<void> getCategories() async {
    var res = await repository.getCategories();
    categories = res.data;
    update();
  }

  Future<void> getProducts({ String? keyword }) async {
    var res = await repository.filterProducts(
        categoryId: selectedCategoryId,
        keyword: keyword,
        orderColumn: selectedSort?.orderColumn,
        orderType: selectedSort?.orderType
    );
    products = res.data;
    update();
  }

  void search(String value) {
    getProducts(keyword: value);
  }

  void sort(Sort sort) {
    selectedSort = sort;
    update();
    getProducts();
  }


  void selectCategory(int id) {
    selectedCategoryId = id;
    getProducts();
    update();
  }

  @override
  void onInit() {
    selectedCategoryId = categoryId;
    selectedSort = defaultSort;
    getCategories();
    getProducts();
    super.onInit();
  }
}

class Sort {
  String orderColumn;
  String orderType;

  Sort({required this.orderColumn, required this.orderType});
}