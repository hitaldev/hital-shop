import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AppbarWidget extends StatelessWidget {
  const AppbarWidget({super.key, this.title, this.widget});

  final String? title;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Color(0xFF6A6A6A).withOpacity(0.15), blurRadius: 6, offset: Offset(0, 1))
        ]
      ),
      child: Stack(
        children: [
          Center(child: Text(title ?? "", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18),)),
          Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: () => Get.back(),
              child: Container(
                padding: EdgeInsets.all(7),
                margin: EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).dividerColor, width: 1),
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Icon(Iconsax.arrow_left),
              ),
            ),
          ),
          widget ?? Container()
        ],
      ),
    );
  }
}
