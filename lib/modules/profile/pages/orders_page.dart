import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hital_shop/helpers/widgets/appbar_widget.dart';
import 'package:hital_shop/modules/profile/controllers/orders_controller.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {

    OrderStatus getStatusColor(String status) {
      if(status == "تحویل داده شده" || status == "پرداخت شده") {
        return OrderStatus(Color(0xFF2AC066), Colors.white);
      } else if(status == "در حال آماده سازی") {
        return OrderStatus(Color(0xFFFEEBEB), Color(0xFFF31A1A));
      } else if(status == "لغو شده") {
        return OrderStatus(Color(0xFFF31A1A), Colors.white);
      }
      return OrderStatus(Color(0xFF2AC066), Colors.white);
    }


    return GetBuilder<OrdersController>(
      init: OrdersController(),
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                AppbarWidget(title: "سفارشات",),
                Expanded(
                  child: controller.response == null ? Center(child: CircularProgressIndicator()) :
                  ListView.builder(
                    padding: EdgeInsets.all(20),
                    itemCount: controller.response!.data!.length,
                    itemBuilder: (context, index) {
                      var order = controller.response!.data![index];
                      return Container(
                        padding: EdgeInsets.all(15),
                        margin: EdgeInsets.only(bottom: 14),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Color(0xFFEBEBEB)),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(color: Color(0xFF7B7B7B).withOpacity(0.09), offset: Offset(0, 1), blurRadius: 14)
                          ]
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text("ارسال سفارش به:", style: TextStyle(color: Color(0xFF8C8C8C), fontSize: 17),),
                                SizedBox(width: 3,),
                                Text(order.address ?? "", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18),),
                                Spacer(),
                                Text("شماره سفارش: ${order.trackingCode}", style: TextStyle(fontSize: 13),)
                              ],
                            ),
                            SizedBox(height: 15,),
                            SizedBox(
                              height: 45,
                              child: ListView.builder(
                                itemCount: order.products!.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Stack(
                                    alignment: Alignment.topLeft,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(horizontal: 10),
                                        decoration: BoxDecoration(
                                          border: Border(left: BorderSide(color: Theme.of(context).dividerColor, width: 1.5))
                                        ),
                                        child: Center(child: Image.network(order.products![index].image ?? "", height: 40)),
                                      ),
                                      Visibility(
                                        visible: order.products![index].count! > 1,
                                        child: Container(
                                          height: 17,
                                          width: 17,
                                          margin: EdgeInsets.only(left: 6),
                                          decoration: BoxDecoration(
                                            color: Color(0xFFCBE0FF),
                                            borderRadius: BorderRadius.circular(100)
                                          ),
                                          child: Center(child: Text(order.products![index].count.toString(), style: TextStyle(fontSize: 11),)),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                            SizedBox(height: 6,),
                            Row(
                              children: [
                                Text(order.products!.length.toString(), style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18),),
                                SizedBox(width: 5,),
                                Text("قلم کالا", style: TextStyle(color: Color(0xFF8C8C8C), fontSize: 15),),
                                SizedBox(width: 10,),
                                Text("قیمت سفارش:", style: TextStyle(color: Color(0xFF8C8C8C), fontSize: 15),),
                                SizedBox(width: 3,),
                                Text(order.totalPrice ?? "", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                                SizedBox(width: 3,),
                                Text("تومان", style: TextStyle(color: Color(0xFF8C8C8C), fontSize: 13),),
                                Spacer(),
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 2, horizontal: 6),
                                  decoration: BoxDecoration(
                                    color: getStatusColor(order.status!).bgColor,
                                    borderRadius: BorderRadius.circular(6)
                                  ),
                                  child: Text(order.status ?? "", style: TextStyle(fontSize: 13, color: getStatusColor(order.status!).textColor),),
                                )
                              ],
                            )
                          ],
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

class OrderStatus {
  Color bgColor;
  Color textColor;

  OrderStatus(this.bgColor, this.textColor);
}