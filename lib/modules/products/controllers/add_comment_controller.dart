import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hital_shop/backend/repositories/product_repository.dart';
import 'package:hital_shop/helpers/widgets/snackbar_widget.dart';
import 'package:hital_shop/modules/products/controllers/comments_controller.dart';

class AddCommentController extends GetxController {
  ProductRepository repository = ProductRepository();
  TextEditingController txtDescription = TextEditingController();
  final int productId;
  int rate = 1;

  AddCommentController(this.productId);

  void onRate(double value) {
    rate = value.toInt();
    update();
  }

  Future<void> addComment() async {
    var res = await repository.addReview(productId: productId, rate: rate, comment: txtDescription.text);
    if(res) {
      Get.find<CommentsController>().getReviews();
      Get.back();
      successMessage("نظر شما با موفقیت ارسال شد");
    } else {
      errorMessage("خطایی وجود دارد");
    }
  }

  @override
  void onInit() {
    super.onInit();
  }
}