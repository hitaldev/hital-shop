import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hital_shop/helpers/widgets/appbar_widget.dart';
import 'package:hital_shop/modules/products/controllers/products_list_controller.dart';
import 'package:hital_shop/modules/products/pages/product_details_page.dart';
import 'package:iconsax/iconsax.dart';

class ProductsListPage extends StatelessWidget {
  const ProductsListPage({super.key, this.categoryId, this.sort});

  final int? categoryId;
  final Sort? sort;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductsListController>(
      init: ProductsListController(categoryId: categoryId, defaultSort: sort),
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: controller.categories == null || controller.products == null ? Center(child: CircularProgressIndicator(),) :
            Column(
              children: [
                AppbarWidget(title: "محصولات"),
                SizedBox(height: 20,),
                Row(
                  children: [
                    SizedBox(width: 20,),
                    Expanded(
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Theme.of(context).dividerColor, width: 1),
                            boxShadow: [
                              BoxShadow(color: Color(0xFFEA5E24).withOpacity(0.19), offset: Offset(0, 1), blurRadius: 4)
                            ]
                        ),
                        child: TextFormField(
                          controller: controller.txtSearch,
                          onChanged: (value) => controller.search(value),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 12),
                            hintText: "نام محصول مورد نظر را بنویسید",
                            hintStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                            suffixIcon: Icon(CupertinoIcons.search, color: Colors.black ,)
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    PopupMenuButton<Sort>(
                      position: PopupMenuPosition.under,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)
                      ),
                      onSelected: (value) => controller.sort(value),
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Theme.of(context).dividerColor, width: 1),
                            boxShadow: [
                              BoxShadow(color: Color(0xFFEA5E24).withOpacity(0.19), offset: Offset(0, 1), blurRadius: 4)
                            ]
                        ),
                        child: Icon(Iconsax.sort, size: 30,),
                      ),
                      itemBuilder: (context) {
                        return [
                          PopupMenuItem(
                            value: Sort(orderColumn: "id", orderType: "DESC"),
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Color(0xFFDEDEDE)))
                                ),
                                child: Center(child: Text("جدیدترین ها", style: TextStyle(fontSize: 14),)),
                              )
                          ),
                          PopupMenuItem(
                            value: Sort(orderColumn: "discount", orderType: "DESC"),
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Color(0xFFDEDEDE)))
                                ),
                                child: Center(child: Text("بیشترین تخفیف", style: TextStyle(fontSize: 14),)),
                              )
                          ),
                          PopupMenuItem(
                            value: Sort(orderColumn: "price", orderType: "ASC"),
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Color(0xFFDEDEDE)))
                                ),
                                child: Center(child: Text("ارزانترین", style: TextStyle(fontSize: 14),)),
                              )
                          ),
                          PopupMenuItem(
                            value: Sort(orderColumn: "price", orderType: "DESC"),
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                child: Center(child: Text("گرانترین", style: TextStyle(fontSize: 14),)),
                              )
                          ),
                        ];
                      },
                    ),
                    SizedBox(width: 20,),
                  ],
                ),
                SizedBox(height: 20,),
                SizedBox(
                  height: 32,
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    itemCount: controller.categories!.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => controller.selectCategory(controller.categories![index].id!),
                        child: Container(
                          margin: EdgeInsets.only(left: 10),
                          padding: EdgeInsets.symmetric(vertical: 3, horizontal: 12),
                          decoration: BoxDecoration(
                            color: controller.selectedCategoryId == controller.categories![index].id! ?  Theme.of(context).primaryColor : Colors.transparent,
                            border: Border.all(color: Theme.of(context).primaryColor, width: 1),
                            borderRadius: BorderRadius.circular(100)
                          ),
                          child: Text(controller.categories![index].title ?? "",
                            style: TextStyle(color: controller.selectedCategoryId == controller.categories![index].id! ?
                             Colors.white : Theme.of(context).primaryColor),),
                        ),
                      );
                    },
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                SizedBox(height: 20,),
                Expanded(
                  child: GridView.builder(
                    itemCount: controller.products!.length,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: MediaQuery.of(context).size.width > 700 ? 5 : 3,
                      mainAxisSpacing: 0,
                      crossAxisSpacing: 20,
                      mainAxisExtent: 200
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => Get.to(ProductDetailsPage(id: controller.products![index].id!)),
                        child: SizedBox(
                          width: 118,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                alignment: Alignment.topLeft,
                                children: [
                                  Container(
                                    height: 130,
                                    width: 118,
                                    padding: EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15),
                                        boxShadow: [
                                          BoxShadow(blurRadius: 3, offset: Offset(0, 1), color: Color(0xFF14489E).withOpacity(0.15))
                                        ],
                                        border: Border.all(color: Theme.of(context).dividerColor, width: 1)
                                    ),
                                    child: Image.network(controller.products![index].image ?? ""),
                                  ),
                                  Visibility(
                                    visible: controller.products![index].discountPercent != 0,
                                    child: Container(
                                      margin: EdgeInsets.only(top: 8, left: 8),
                                      padding: EdgeInsets.symmetric(horizontal: 3, vertical: 1),
                                      decoration: BoxDecoration(
                                          color: Color(0xFFFF3D3D),
                                          borderRadius: BorderRadius.circular(4)
                                      ),
                                      child: Text(controller.products![index].discountPercent.toString() + "%", style: TextStyle(fontSize: 11, color: Colors.white,
                                          fontWeight: FontWeight.w900)),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5,),
                              Row(
                                children: [
                                  Text(controller.products![index].price ?? "", style: TextStyle(fontSize: 16),),
                                  SizedBox(width: 2,),
                                  Text("تومان", style: TextStyle(fontSize: 10, color: Colors.grey),),
                                  Spacer(),
                                  Visibility(
                                    visible: controller.products![index].discountPercent != 0,
                                    child: Text(controller.products![index].realPrice ?? "", style: TextStyle(fontSize: 12, color: Color(0xFF8C8C8C),
                                        fontWeight: FontWeight.bold, decoration: TextDecoration.lineThrough),),
                                  ),
                                ],
                              ),
                              Text(controller.products![index].title ?? "", overflow: TextOverflow.ellipsis,)
                            ],
                          ),
                        ),
                      );
                    },
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
