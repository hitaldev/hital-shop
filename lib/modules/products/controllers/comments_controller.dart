import 'package:get/get.dart';
import 'package:hital_shop/backend/repositories/product_repository.dart';
import 'package:hital_shop/backend/response/review_response.dart';

class CommentsController extends GetxController {

  final int id;

  ProductRepository repository = ProductRepository();
  ReviewResponse? response;

  CommentsController(this.id);

  Future<void> getReviews() async {
    response = await repository.getReviews(id);
    update();
  }

  @override
  void onInit() {
    getReviews();
    super.onInit();
  }
}