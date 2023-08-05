import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:hital_shop/helpers/widgets/appbar_widget.dart';
import 'package:hital_shop/modules/products/controllers/comments_controller.dart';
import 'package:hital_shop/modules/products/widgets/comment_bottom_sheet.dart';
import 'package:iconsax/iconsax.dart';

class CommentsPage extends StatelessWidget {
  const CommentsPage({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CommentsController>(
      init:CommentsController(id),
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                AppbarWidget(title: "نظرات",),
                Expanded(
                  child: controller.response == null  ? Center(child: CircularProgressIndicator()) :
                  ListView.builder(
                    padding: EdgeInsets.all(20),
                    itemCount: controller.response!.data!.length,
                    itemBuilder: (context, index) {
                      var review = controller.response!.data![index];
                      return Container(
                        padding: EdgeInsets.all(14),
                        margin: EdgeInsets.only(bottom: 14),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Theme.of(context).dividerColor, width: 1)
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(review.user ?? "", style: TextStyle(color: Color(0xFF8C8C8C), fontSize: 14),),
                                Spacer(),
                                Directionality(
                                  textDirection: TextDirection.ltr,
                                  child: RatingBarIndicator(
                                    rating: review.rate!.toDouble(),
                                    unratedColor: Color(0xFFEDEDED),
                                    itemBuilder: (context, index) => Icon(
                                      Iconsax.star1,
                                      color: Color(0xFFF4D42D),
                                    ),
                                    itemCount: 5,
                                    itemSize: 24.0,
                                    direction: Axis.horizontal,
                                  ),
                                ),
                              ],
                            ),
                            Text(review.date ?? "", style: TextStyle(color: Color(0xFF8C8C8C), fontSize: 12),),
                            SizedBox(height: 10,),
                            Text(review.comment ?? "", style: TextStyle(fontSize: 16),),
                            Visibility(
                              visible: review.reply != null,
                              child: Column(
                                children: [
                                  SizedBox(height: 20,),
                                  Container(height: 1, width: double.infinity, color: Theme.of(context).dividerColor,),
                                  SizedBox(height: 10,),
                                  Row(
                                    children: [
                                      Text("پاسخ: ", style: TextStyle(color: Color(0xFF8C8C8C), fontSize: 16),),
                                      Text(review.reply ?? "", style: TextStyle(fontSize: 16),),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                isScrollControlled: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(25))
                ),
                context: context, builder: (context) => CommentBottomSheet(productId: id),
              );
            },
            backgroundColor: Theme.of(context).primaryColor,
            child: Icon(Icons.add),
          ),
        );
      }
    );
  }
}

