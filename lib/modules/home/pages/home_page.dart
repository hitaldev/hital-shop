import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hital_shop/modules/home/controllers/home_controller.dart';
import 'package:hital_shop/modules/home/pages/categories_page.dart';
import 'package:hital_shop/modules/home/pages/dashboard_page.dart';
import 'package:hital_shop/modules/products/controllers/cart_controller.dart';
import 'package:hital_shop/modules/products/pages/cart_page.dart';
import 'package:hital_shop/modules/products/pages/products_list_page.dart';
import 'package:hital_shop/modules/profile/pages/bookmarks_page.dart';
import 'package:hital_shop/modules/profile/pages/profile_page.dart';
import 'package:iconsax/iconsax.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    children: [
                      SizedBox(width: 20,),
                      Stack(
                        children: [
                          Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Color(0xFFEEEEEE))
                            ),
                            child: Icon(Iconsax.bag_2, size: 24,),
                          ),
                          GetBuilder<CartController>(
                            init: CartController(),
                            builder: (controller) {
                              return controller.cartResponse == null ? Container() :
                              Visibility(
                                visible: controller.cartResponse!.totalItems != 0,
                                child: Container(
                                  height: 17,
                                  width: 17,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Color(0xFFFF6060)
                                  ),
                                  child: Center(child: Text(controller.cartResponse!.totalItems.toString(),
                                    style: TextStyle(fontSize: 13, color: Colors.white,fontWeight: FontWeight.bold),)),
                                ),
                              );
                            }
                          ),
                        ],
                      ),
                      Spacer(),
                      Image.asset("assets/images/logo_horiz.png", height: 38,),
                      Spacer(),
                      GestureDetector(
                        onTap: () => Get.to(ProductsListPage()),
                        child: Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Color(0xFFEEEEEE))
                          ),
                          child: Icon(Iconsax.search_normal, size: 24,),
                        ),
                      ),
                      SizedBox(width: 20,),
                    ],
                  ),
                ),
                Expanded(
                  child: PageView(
                    controller: controller.pageController,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      DashboardPage(),
                      CategoriesPage(),
                      CartPage(),
                      BookmarksPage(),
                      ProfilePage(),
                    ],
                  ),
                ),
                Container(
                  height: 110,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        height: 70,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                          boxShadow: [
                            BoxShadow(color: Colors.black.withOpacity(0.09), offset: Offset(0, -3), blurRadius: 6)
                          ]
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: List.generate(controller.items.length, (index) {
                              return Padding(
                                padding: EdgeInsets.only(left: index == 1 ? 50.0 : 0),
                                child: GestureDetector(
                                  onTap: () => controller.changePage(index + 1),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(controller.items[index].icon),
                                      SizedBox(height: 6,),
                                      controller.currentPage == index + 1 ?
                                      Container(height: 2, width: 16, color: Theme.of(context).primaryColor,) :
                                      Container()
                                    ],
                                  )
                                ),
                              );
                            }),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        child: GestureDetector(
                          onTap: () => controller.changePage(0),
                          child: Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              gradient: LinearGradient(colors: [Color(0xFF3B7BE3),
                                Color(0xFF29388B)], begin: Alignment.topCenter, end: Alignment.bottomCenter)
                            ),
                            child: Icon(Iconsax.home_2, color: Colors.white, size: 28,),
                          ),
                        ),
                      )
                    ],
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
