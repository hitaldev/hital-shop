import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hital_shop/helpers/widgets/appbar_widget.dart';
import 'package:hital_shop/helpers/widgets/button_widget.dart';
import 'package:hital_shop/modules/profile/controllers/address_contorller.dart';
import 'package:hital_shop/modules/profile/pages/add_address_page.dart';
import 'package:iconsax/iconsax.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddressController>(
      init: AddressController(),
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                AppbarWidget(title: "آدرس ها",),
                Expanded(
                  child: controller.response == null ? Center(child: CircularProgressIndicator()) :
                  ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    itemCount: controller.response!.data!.length,
                    itemBuilder: (context, index) {
                      var address = controller.response!.data![index];
                      return Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(bottom: 15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Theme.of(context).dividerColor, width: 1)
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
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: ButtonWidget(text: "افزودن آدرس", hasBorder: true,
                    onPressed: () => Get.to(AddAddressPage()),),
                ),
                SizedBox(height: 40,)
              ],
            ),
          ),
        );
      }
    );
  }
}

