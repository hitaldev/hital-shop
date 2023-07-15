import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hital_shop/helpers/widgets/appbar_widget.dart';
import 'package:hital_shop/helpers/widgets/button_widget.dart';
import 'package:hital_shop/modules/products/controllers/product_details_controller.dart';
import 'package:hital_shop/modules/products/pages/comments_page.dart';
import 'package:hital_shop/modules/products/widgets/product_slider_widget.dart';
import 'package:iconsax/iconsax.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailsController>(
      init: ProductDetailsController(id),
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: controller.product == null ? Center(child: CircularProgressIndicator()) : Column(
              children: [
                AppbarWidget(
                  widget: Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () => controller.bookmark(),
                      child: Container(
                      padding: EdgeInsets.all(7),
                      margin: EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                          border: Border.all(color: Theme.of(context).dividerColor, width: 1),
                          borderRadius: BorderRadius.circular(12)
                      ),
                      child: controller.product!.bookmarked! ? Icon(CupertinoIcons.heart_fill, color: Color(0xFFED723F),) : Icon(CupertinoIcons.heart),
                ),
                    ),
                  ),),
                SizedBox(height: 10,),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProductSliderWidget(images: controller.product!.gallery ?? []),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            SizedBox(width: 20,),
                            Text("دسته بندی: ${controller.product!.category}", style: TextStyle(color: Theme.of(context).primaryColor),),
                            Spacer(),
                            Visibility(
                                visible: controller.product!.discountPercent != 0,
                                child: Text(controller.product!.realPrice ?? "",
                                style: TextStyle(decoration: TextDecoration.lineThrough, color: Color(0xFF8C8C8C)),)
                            ),
                            SizedBox(width: 8,),
                            Visibility(
                              visible: controller.product!.discountPercent != 0,
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 3),
                                decoration: BoxDecoration(
                                    color: Color(0xFFFF3D3D),
                                    borderRadius: BorderRadius.circular(4)
                                ),
                                child: Text(controller.product!.discountPercent.toString() + "%", style: TextStyle(fontSize: 12, color: Colors.white),),
                              ),
                            ),
                            SizedBox(width: 20,),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(width: 20,),
                            Text(controller.product!.title ?? "", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),),
                            Spacer(),
                            Text(controller.product!.price ?? "", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                            SizedBox(width: 4,),
                            Text("تومان", style: TextStyle(
                                color: Color(0xFF8C8C8C), fontSize: 12),),
                            SizedBox(width: 20,),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(controller.product!.description ?? "",
                            style: TextStyle(color: Color(0xFF8C8C8C)),),
                        ),
                        SizedBox(height: 20,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: MaterialButton(
                            minWidth: double.infinity,
                            height: 48,
                            color: Colors.white,
                            elevation: 0,
                            onPressed: () {
                              Get.to(CommentsPage(id: id,));
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: BorderSide(color: Theme.of(context).dividerColor, width: 1)
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Iconsax.message_text_1, size: 22, color: Color(0xFF8C8C8C),),
                                SizedBox(width: 8,),
                                Text("نظرات", style: TextStyle(fontSize: 16),),
                                Spacer(),
                                Text("${controller.product!.reviewsCount} نظر", style: TextStyle(color: Color(0xFF8C8C8C)),),
                                SizedBox(width: 3,),
                                Icon(CupertinoIcons.chevron_left, size: 16, color: Color(0xFF8C8C8C),)
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 30,),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25)),
                    boxShadow: [
                      BoxShadow(color: Colors.black.withOpacity(0.09), offset: Offset(0, -3), blurRadius: 6)
                    ]
                  ),
                  child: controller.product!.cartCount == 0 ? ButtonWidget(text: "افزودن به سبد خرید", onPressed: () {
                    controller.addToCart(true);
                  },) : Container(
                    width: double.infinity,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 15,),
                        GestureDetector(
                          onTap: () => controller.addToCart(true),
                          child: Icon(Iconsax.add, color: Colors.white,)
                        ),
                        Spacer(),
                        Text(controller.product!.cartCount.toString(), style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),),
                        Spacer(),
                        GestureDetector(
                          onTap: () => controller.addToCart(false),
                          child: Icon(controller.product!.cartCount == 1 ? Iconsax.trash : Iconsax.minus, color: Colors.white,)
                        ),
                        SizedBox(width: 15,),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }
    );
  }
}
