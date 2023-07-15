import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class HomeController extends GetxController {
  PageController pageController = PageController();
  int currentPage = 0;

  List<MenuItem> items = [
    MenuItem(icon: Iconsax.element_3),
    MenuItem(icon: Iconsax.shopping_cart),
    MenuItem(icon: Iconsax.heart),
    MenuItem(icon: Iconsax.user),
  ];

  void changePage(int page) {
    pageController.animateToPage(page, duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
    currentPage = page;
    update();
  }
}

class MenuItem {
  IconData icon;
  bool selected;
  
  MenuItem({ required this.icon, this.selected = false });
}