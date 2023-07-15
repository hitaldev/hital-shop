import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:hital_shop/helpers/widgets/button_widget.dart';
import 'package:hital_shop/modules/products/controllers/add_comment_controller.dart';
import 'package:iconsax/iconsax.dart';

class CommentBottomSheet extends StatelessWidget {
  const CommentBottomSheet({super.key, required this.productId});

  final int productId;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddCommentController>(
      init: AddCommentController(productId),
      builder: (controller) {
        return Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            padding: EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("ارسال نظر", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),),
                Center(
                  child: Directionality(
                    textDirection: TextDirection.ltr,
                    child: RatingBar.builder(
                      initialRating: 1,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: false,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                      unratedColor: Color(0xFFEDEDED),
                      itemBuilder: (context, index) => Icon(
                        Iconsax.star1,
                        color: Color(0xFFF4D42D),
                      ),
                      onRatingUpdate: (rating) {
                        controller.onRate(rating);
                      },
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                TextFormField(
                  controller: controller.txtDescription,
                  maxLines: 6,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Color(0xFFE1E1E1), width: 0.5)
                    ),
                    hintText: "نظر خود را وارد کنید"
                  ),
                ),
                SizedBox(height: 10,),
                ButtonWidget(text: "ارسال نظر", onPressed: () => controller.addComment(),),
              ],
            ),
          ),
        );
      }
    );
  }
}
