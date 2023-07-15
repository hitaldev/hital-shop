import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hital_shop/helpers/widgets/appbar_widget.dart';
import 'package:hital_shop/helpers/widgets/button_widget.dart';
import 'package:hital_shop/modules/products/controllers/cart_controller.dart';
import 'package:hital_shop/modules/products/controllers/order_controller.dart';
import 'package:hital_shop/modules/products/widgets/radio_widget.dart';
import 'package:hital_shop/modules/profile/pages/add_address_page.dart';
import 'package:iconsax/iconsax.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(
      init: OrderController(),
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                AppbarWidget(title: "تکمیل سفارش",),
                Expanded(
                  child: controller.response == null ? Center(child: CircularProgressIndicator()) :
                  SingleChildScrollView(
                    padding: EdgeInsets.all(20),
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("آدرس خود را انتخاب کنید",
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),),
                          SizedBox(height: 15,),
                          Column(
                            children: List.generate(controller.response!.data!.length, (index) {
                              var address = controller.response!.data![index];
                              return GestureDetector(
                                onTap: () => controller.selectAddress(address),
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  margin: EdgeInsets.only(bottom: 15),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(color: controller.selectedAddress?.id == address.id ?
                                      Theme.of(context).primaryColor :
                                      Theme.of(context).dividerColor, width: 1)
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(address.title ?? "", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),),
                                          Spacer(),
                                          GestureDetector(
                                            onTap: () => Get.to(AddAddressPage(address: address,)),
                                            child: Container(
                                              padding: EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(8),
                                                  border: Border.all(color: Theme.of(context).dividerColor, width: 1)
                                              ),
                                              child: Icon(Iconsax.edit, size: 20, color: Theme.of(context).primaryColor,),
                                            ),
                                          ),
                                          SizedBox(width: 10,),
                                          GestureDetector(
                                            onTap: () => controller.deleteAddress(address.id!),
                                            child: Container(
                                              padding: EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(8),
                                                  border: Border.all(color: Theme.of(context).dividerColor, width: 1)
                                              ),
                                              child: Icon(Iconsax.trash, size: 20, color: Theme.of(context).primaryColor,),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10,),
                                      Text(address.address ?? "",
                                        style: TextStyle(color: Color(0xFF8C8C8C)),),
                                      SizedBox(height: 6,),
                                      Visibility(
                                        visible: address.postalCode != null,
                                        child: Row(
                                          children: [
                                            Text("کد پستی: ", style: TextStyle(fontWeight: FontWeight.bold),),
                                            Text(address.postalCode.toString(), style: TextStyle(color: Color(0xFF8C8C8C)),),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }),
                          ),
                          ButtonWidget(text: "افزودن آدرس", hasBorder: true,
                            onPressed: () => Get.to(AddAddressPage()),),
                          SizedBox(height: 20,),
                          Text("شیوه ارسال را انتخاب کنید",
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),),
                          SizedBox(height: 12,),
                          RadioWidget(),
                          SizedBox(height: 15,),
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
                                    Text("هزینه ارسال:", style: TextStyle(color: Color(0xFF8C8C8C), fontSize: 16),),
                                    Spacer(),
                                    Text(controller.selectedMethod?.price ?? "0", style: TextStyle(fontSize: 20),),
                                    SizedBox(width: 5,),
                                    Text("تومان", style: TextStyle(fontSize: 12, color: Color(0xFF8C8C8C)),),
                                    SizedBox(width: 20,),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(width: 20,),
                                    Text("مبلغ:", style: TextStyle(color: Color(0xFF8C8C8C), fontSize: 16),),
                                    Spacer(),
                                    Text(Get.find<CartController>().cartResponse!.price ?? "", style: TextStyle(fontSize: 20),),
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
                                    Text(Get.find<CartController>().cartResponse!.discountPrice ?? "", style: TextStyle(fontSize: 20, color: Color(0xFFFC7878)),),
                                    SizedBox(width: 5,),
                                    Text("تومان", style: TextStyle(fontSize: 12, color: Color(0xFF8C8C8C)),),
                                    SizedBox(width: 20,),
                                  ],
                                ),
                                SizedBox(height: 5,),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                                  decoration: BoxDecoration(
                                      border: Border(top: BorderSide(color: Theme.of(context).dividerColor))
                                  ),
                                  child:  Row(
                                    children: [
                                      Text("مبلغ کل:", style: TextStyle(fontSize: 16, color: Color(0xFF8C8C8C)),),
                                      Spacer(),
                                      Text(controller.getTotalPrice(), style: TextStyle(fontSize: 20),),
                                      SizedBox(width: 5,),
                                      Text("تومان", style: TextStyle(fontSize: 12, color: Color(0xFF8C8C8C)),),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 15,),
                          ButtonWidget(text: "پرداخت آنلاین", onPressed: () => controller.order(),)
                        ],
                      ),
                    ),
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

