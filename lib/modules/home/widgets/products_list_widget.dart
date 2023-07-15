import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hital_shop/backend/models/product.dart';
import 'package:hital_shop/modules/products/controllers/products_list_controller.dart';
import 'package:hital_shop/modules/products/pages/product_details_page.dart';
import 'package:hital_shop/modules/products/pages/products_list_page.dart';
import 'package:iconsax/iconsax.dart';

class ProductsListWidget extends StatelessWidget {
  const ProductsListWidget({super.key, required this.title, required this.products, this.sort});

  final String title;
  final List<Product> products;
  final Sort? sort;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => Get.to(ProductsListPage(sort: sort,)),
          child: Row(
            children: [
              Text(title, style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16),),
              Spacer(),
              Text("نمایش همه", style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 14),),
              SizedBox(width: 2,),
              Icon(Iconsax.arrow_left, size: 18, color: Theme.of(context).primaryColor,),
            ],
          ),
        ),
        SizedBox(height: 12,),
        SizedBox(
          height: 200,
          child: ListView.builder(
            itemCount: products.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => Get.to(ProductDetailsPage(id: products[index].id!,)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: SizedBox(
                    width: 118,
                    child: Column(
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
                              child: Image.network(products[index].image ?? ""),
                            ),
                            Visibility(
                              visible: products[index].discountPercent != 0,
                              child: Container(
                                margin: EdgeInsets.only(top: 8, left: 8),
                                padding: EdgeInsets.symmetric(horizontal: 3, vertical: 1),
                                decoration: BoxDecoration(
                                  color: Color(0xFFFF3D3D),
                                  borderRadius: BorderRadius.circular(4)
                                ),
                                child: Text(products[index].discountPercent.toString() + "%", style: TextStyle(fontSize: 11, color: Colors.white,
                                    fontWeight: FontWeight.w900)),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5,),
                        Row(
                          children: [
                            Text(products[index].price ?? "", style: TextStyle(fontSize: 16),),
                            SizedBox(width: 2,),
                            Text("تومان", style: TextStyle(fontSize: 10, color: Colors.grey),),
                            Spacer(),
                            Visibility(
                              visible: products[index].discountPercent != 0,
                              child: Text(products[index].realPrice ?? "", style: TextStyle(fontSize: 12, color: Color(0xFF8C8C8C),
                                  fontWeight: FontWeight.bold, decoration: TextDecoration.lineThrough),),
                            ),
                          ],
                        ),
                        Text(products[index].title ?? "", overflow: TextOverflow.ellipsis,)
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}

