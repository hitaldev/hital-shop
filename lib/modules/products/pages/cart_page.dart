import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hital_shop/helpers/widgets/button_widget.dart';
import 'package:hital_shop/modules/products/controllers/cart_controller.dart';
import 'package:hital_shop/modules/products/pages/order_page.dart';
import 'package:iconsax/iconsax.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: controller.cartResponse == null ? Center(child: CircularProgressIndicator()) : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("سبد خرید", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),),
              SizedBox(height: 15,),
              Expanded(
                child: ListView.builder(
                  itemCount: controller.cartResponse!.items!.length,
                  itemBuilder: (context, index) {
                    var cart = controller.cartResponse!.items![index];
                    return Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 90,
                              width: 90,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(14),
                                  boxShadow: [
                                    BoxShadow(color: Color(0xFF14489E).withOpacity(0.15), offset: Offset(0, 1), blurRadius: 3)
                                  ]
                              ),
                              child: Center(child: Image.network(cart.product!.image ?? "", height: 80,)),
                            ),
                            SizedBox(width: 10,),
                            Expanded(
                              child: Container(
                                height: 101,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(cart.product!.title ?? "", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                                    Spacer(),
                                    Visibility(
                                        visible: cart.product!.discountPercent != 0,
                                        child: Text(cart.product!.realPrice ?? "", style: TextStyle(decoration: TextDecoration.lineThrough, color: Color(0xFF8C8C8C)),)
                                    ),
                                    Row(
                                      children: [
                                        Text(cart.product!.price ?? "", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                                        SizedBox(width: 5,),
                                        Text("تومان", style: TextStyle(fontSize: 12, color: Color(0xFF8C8C8C)),),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 90,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    onTap: () => controller.addToCart(cart.product!.id!, false, true),
                                    child: Container(
                                      height: 35,
                                      width: 35,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(8),
                                          border: Border.all(color: Color(0xFFEBEBEB)),
                                          boxShadow: [
                                            BoxShadow(color: Color(0xFFEA5E24).withOpacity(0.19), offset: Offset(0, 1), blurRadius: 4)
                                          ]
                                      ),
                                      child: Icon(Iconsax.trash, color: Theme.of(context).primaryColor,),
                                    ),
                                  ),
                                  Container(
                                    height: 35,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(color: Color(0xFFEBEBEB)),
                                        boxShadow: [
                                          BoxShadow(color: Color(0xFFEA5E24).withOpacity(0.19), offset: Offset(0, 1), blurRadius: 4)
                                        ]
                                    ),
                                    child: Row(
                                      children: [
                                        SizedBox(width: 6,),
                                        GestureDetector(
                                          onTap: () => controller.addToCart(cart.product!.id!, false),
                                          child: Icon(Iconsax.minus, color: Theme.of(context).primaryColor,)
                                        ),
                                        SizedBox(width: 8,),
                                        Text(cart.count.toString(),
                                          style: TextStyle(color: Theme.of(context).primaryColor,
                                              fontSize: 20, fontWeight: FontWeight.bold),),
                                        SizedBox(width: 8,),
                                        GestureDetector(
                                          onTap: () => controller.addToCart(cart.product!.id!, true),
                                          child: Icon(Iconsax.add, color: Theme.of(context).primaryColor,),
                                        ),
                                        SizedBox(width: 6,),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15,),
                        Container(
                          height: 0.5,
                          width: double.infinity,
                          color: Color(0xFFE1E1E1),
                        ),
                        SizedBox(height: 15,)
                      ],
                    );
                  },
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(color: Color(0xFF14489E).withOpacity(0.15), offset: Offset(0, 1), blurRadius: 3)
                  ],
                ),
                child: Column(
                  children: [
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        SizedBox(width: 20,),
                        Text("مبلغ:", style: TextStyle(color: Color(0xFF8C8C8C), fontSize: 16),),
                        Spacer(),
                        Text(controller.cartResponse!.price ?? "", style: TextStyle(fontSize: 20),),
                        SizedBox(width: 5,),
                        Text("تومان", style: TextStyle(fontSize: 12, color: Color(0xFF8C8C8C)),),
                        SizedBox(width: 20,),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(width: 20,),
                        Text("مبلغ تخفیف:", style: TextStyle(color: Color(0xFF8C8C8C), fontSize: 16),),
                        Spacer(),
                        Text(controller.cartResponse!.discountPrice ?? "", style: TextStyle(fontSize: 20, color: Color(0xFFFC7878)),),
                        SizedBox(width: 5,),
                        Text("تومان", style: TextStyle(fontSize: 12, color: Color(0xFF8C8C8C)),),
                        SizedBox(width: 20,),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))
                      ),
                      child:  Row(
                        children: [
                          Text("مبلغ کل:", style: TextStyle(color: Colors.white, fontSize: 16),),
                          Spacer(),
                          Text(controller.cartResponse!.totalPrice ?? "", style: TextStyle(fontSize: 20, color: Colors.white),),
                          SizedBox(width: 5,),
                          Text("تومان", style: TextStyle(fontSize: 12, color: Color(0xFFD4D4D4)),),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              ButtonWidget(text: "ثبت سفارش", onPressed: () {
                Get.to(OrderPage());
              },)

            ],
          ),
        );
      }
    );
  }

  @override
  bool get wantKeepAlive => true;
}

