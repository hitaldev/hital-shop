import 'package:get/get.dart';
import 'package:hital_shop/backend/models/product.dart';
import 'package:hital_shop/backend/repositories/product_repository.dart';
import 'package:hital_shop/backend/repositories/profile_repository.dart';
import 'package:hital_shop/modules/products/controllers/cart_controller.dart';
import 'package:hital_shop/modules/profile/controllers/bookmarks_controller.dart';

class ProductDetailsController extends GetxController {
  ProductRepository repository = ProductRepository();
  ProfileRepository profileRepository = ProfileRepository();
  Product? product;

  final int id;

  ProductDetailsController(this.id);

  Future<void> getProductDetails() async {
    product = await repository.getProductDetails(id);
    update();
  }

  Future<void> bookmark() async {
    var res = await profileRepository.bookmark(id);
    if(res) {
      product!.bookmarked = !product!.bookmarked!;
      if(Get.isRegistered<BookmarksController>()) {
        Get.find<BookmarksController>().getBookmarks();
      }
      update();
    }
  }

  Future<void> addToCart(bool increment) async {
    var res = await repository.addToCart(productId: id, increment: increment);
    product!.cartCount = res;
    Get.find<CartController>().getCart();
    update();
  }

  @override
  void onInit() {
    getProductDetails();
    super.onInit();
  }

}