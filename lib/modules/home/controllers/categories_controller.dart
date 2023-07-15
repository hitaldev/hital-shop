import 'package:get/get.dart';
import 'package:hital_shop/backend/repositories/product_repository.dart';
import 'package:hital_shop/backend/response/categories_response.dart';

class CategoriesController extends GetxController {
  ProductRepository repository = ProductRepository();
  CategoriesResponse? categories;

  Future<void> getCategories() async {
    categories = await repository.getCategories();
    update();
  }

  @override
  void onInit() {
    getCategories();
    super.onInit();
  }
}