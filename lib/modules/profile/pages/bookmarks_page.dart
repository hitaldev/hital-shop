import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hital_shop/modules/products/pages/product_details_page.dart';
import 'package:hital_shop/modules/profile/controllers/bookmarks_controller.dart';

class BookmarksPage extends StatefulWidget {
  const BookmarksPage({super.key});

  @override
  State<BookmarksPage> createState() => _BookmarksPageState();
}

class _BookmarksPageState extends State<BookmarksPage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookmarksController>(
      init: BookmarksController(),
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("علاقه مندی ها", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),),
              SizedBox(height: 15,),
              Expanded(
                child: controller.response == null ? Center(child: CircularProgressIndicator()) :
                ListView.builder(
                  itemCount: controller.response!.data!.length,
                  itemBuilder: (context, index) {
                    var product = controller.response!.data![index];
                    return GestureDetector(
                      onTap: () => Get.to(ProductDetailsPage(id: product.id!)),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 90,
                                width: 90,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(14),
                                  boxShadow: [
                                    BoxShadow(color: Color(0xFF14489E).withOpacity(0.15), offset: Offset(0, 1), blurRadius: 3)
                                  ]
                                ),
                                child: Center(child: Image.network(product.image ?? "", height: 80,)),
                              ),
                              SizedBox(width: 10,),
                              Expanded(
                                child: Container(
                                  height: 101,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(product.title ?? "", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                                      Spacer(),
                                      Visibility(
                                        visible: product.discountPercent != 0,
                                          child: Text(product.realPrice ?? "", style: TextStyle(decoration: TextDecoration.lineThrough, color: Color(0xFF8C8C8C)),)
                                      ),
                                      Row(
                                        children: [
                                          Text(product.price ?? "", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                                          SizedBox(width: 5,),
                                          Text("تومان", style: TextStyle(fontSize: 12, color: Color(0xFF8C8C8C)),),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () => controller.deleteBookmark(product.id!),
                                child: Container(
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(color: Color(0xFFEBEBEB)),
                                      boxShadow: [
                                        BoxShadow(color: Color(0xFFEA5E24).withOpacity(0.19), offset: Offset(0, 1), blurRadius: 4)
                                      ]
                                  ),
                                  child: Icon(CupertinoIcons.heart_fill, color: Color(0xFFED723F),),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15,),
                          Container(
                            height: 0.5,
                            width: double.infinity,
                            color: Color(0xFFE1E1E1),
                          ),
                          SizedBox(height: 15,)
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        );
      }
    );
  }

  @override
  bool get wantKeepAlive => true;
}

