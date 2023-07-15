import 'package:get/get.dart';
import 'package:hital_shop/backend/repositories/product_repository.dart';
import 'package:hital_shop/backend/response/cart_response.dart';

class CartController extends GetxController {
  ProductRepository repository = ProductRepository();
  CartResponse? cartResponse;

  Future<void> getCart() async {
    cartResponse = await repository.getCart();
    update();
  }

  Future<void> addToCart(int id, bool increment, [bool delete = false]) async {
    var res = await repository.addToCart(productId: id, increment: increment, delete: delete);
    getCart();
    update();
  }

  @override
  void onInit() {
    getCart();
    super.onInit();
  }
}