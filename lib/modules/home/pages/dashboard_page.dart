import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hital_shop/modules/home/controllers/dashboard_controller.dart';
import 'package:hital_shop/modules/home/widgets/categories_list_widget.dart';
import 'package:hital_shop/modules/home/widgets/products_list_widget.dart';
import 'package:hital_shop/modules/home/widgets/slider_widget.dart';
import 'package:hital_shop/modules/products/controllers/products_list_controller.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      init: DashboardController(),
      builder: (controller) {
        return controller.dashboardResponse == null ? Center(child: CircularProgressIndicator()) :
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              children: [
                SliderWidget(images: controller.dashboardResponse!.sliders ?? []),
                SizedBox(height: 15,),
                CategoriesListWidget(categories: controller.dashboardResponse!.categories ?? []),
                SizedBox(height: 15,),
                ProductsListWidget(title: "تخفیف های شگفت انگیز",
                    products: controller.dashboardResponse!.discountedProducts ?? [],
                    sort: Sort(orderColumn: "discount", orderType: "DESC")),
                ProductsListWidget(title: "جدیدترین محصولات", products: controller.dashboardResponse!.latestProducts ?? []),
              ],
            ),
          ),
        );
      }
    );
  }

  @override
  bool get wantKeepAlive => true;
}
