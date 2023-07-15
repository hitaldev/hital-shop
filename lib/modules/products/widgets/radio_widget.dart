import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hital_shop/modules/products/controllers/order_controller.dart';

class RadioWidget extends StatefulWidget {
  const RadioWidget({super.key});

  @override
  State<RadioWidget> createState() => _RadioWidgetState();
}

class _RadioWidgetState extends State<RadioWidget> {

  List<ShippingMethod> methods = [
    ShippingMethod(title: "پست پیشتاز (ارسال سریع)", price: "20,000", value: 1, isSelected: false),
    ShippingMethod(title: "تیپاکس", price: "10,000", value: 2),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(methods.length, (index) {
        var method = methods[index];
        return GestureDetector(
          onTap: () {
            methods.forEach((element) {
              element.isSelected = false;
            });
            methods[index].isSelected = true;
            Get.find<OrderController>().selectMethod(method);
            setState(() {});
          },
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.only(bottom: 10),
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Theme.of(context).dividerColor),
                borderRadius: BorderRadius.circular(12)
            ),
            child: Row(
              children: [
                Text(method.title, style: TextStyle(fontSize: 16, color: Color(0xFF8C8C8C)),),
                Spacer(),
                Text(method.price, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                SizedBox(width: 2,),
                Text("تومان", style: TextStyle(color: Color(0xFF8C8C8C), fontSize: 12),),
                SizedBox(width: 10,),
                Container(
                  width: 22,
                  height: 22,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(color: Color(0xFF707070))
                  ),
                  child: Visibility(
                    visible: method.isSelected,
                    child: Center(
                      child: Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Theme.of(context).primaryColor
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

class ShippingMethod {
  String title;
  String price;
  bool isSelected;
  int value;
  
  ShippingMethod({required this.title, required this.price, this.isSelected = false, required this.value});
}