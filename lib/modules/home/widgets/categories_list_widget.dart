import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hital_shop/backend/models/category.dart';
import 'package:hital_shop/modules/home/controllers/home_controller.dart';
import 'package:hital_shop/modules/products/pages/products_list_page.dart';
import 'package:iconsax/iconsax.dart';

class CategoriesListWidget extends StatelessWidget {
  const CategoriesListWidget({super.key, required this.categories});

  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => Get.find<HomeController>().changePage(1),
          child: Row(
            children: [
              Text("دسته بندی ها", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16),),
              Spacer(),
              Text("نمایش همه", style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 14),),
              SizedBox(width: 2,),
              Icon(Iconsax.arrow_left, size: 18, color: Theme.of(context).primaryColor,),
            ],
          ),
        ),
        SizedBox(height: 12,),
        SizedBox(
          height: 150,
          child: ListView.builder(
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: GestureDetector(
                  onTap: () => Get.to(ProductsListPage(categoryId: categories[index].id,)),
                  child: Column(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        padding: EdgeInsets.all(17),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(blurRadius: 3, offset: Offset(0, 1), color: Color(0xFF14489E).withOpacity(0.15))
                          ],
                          border: Border.all(color: Theme.of(context).dividerColor, width: 1)
                        ),
                        child: Image.network(categories[index].image ?? ""),
                      ),
                      SizedBox(height: 5,),
                      Text(categories[index].title ?? "")
                    ],
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

