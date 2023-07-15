import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hital_shop/modules/home/controllers/categories_controller.dart';
import 'package:hital_shop/modules/products/pages/products_list_page.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoriesController>(
      init: CategoriesController(),
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("دسته بندی ها", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),),
              SizedBox(height: 20,),
              controller.categories == null ? Center(child: CircularProgressIndicator(),) : Expanded(
                child: GridView.builder(
                  itemCount: controller.categories!.data!.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 6,
                    crossAxisSpacing: 6,
                    mainAxisExtent: 110
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => Get.to(ProductsListPage(categoryId: controller.categories!.data![index].id,)),
                      child: Column(
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            padding: EdgeInsets.all(14),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(blurRadius: 3, offset: Offset(0, 1), color: Color(0xFF14489E).withOpacity(0.15))
                                ],
                                border: Border.all(color: Theme.of(context).dividerColor, width: 1)
                            ),
                            child: Image.network(controller.categories!.data![index].image ?? ""),
                          ),
                          SizedBox(height: 5,),
                          Text(controller.categories!.data![index].title ?? "", style: TextStyle(fontSize: 13),)
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
