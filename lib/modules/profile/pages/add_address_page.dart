import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hital_shop/backend/response/address_response.dart';
import 'package:hital_shop/helpers/widgets/appbar_widget.dart';
import 'package:hital_shop/helpers/widgets/button_widget.dart';
import 'package:hital_shop/helpers/widgets/text_field_widget.dart';
import 'package:hital_shop/modules/profile/controllers/add_address_controller.dart';
import 'package:hital_shop/modules/profile/pages/map_page.dart';
import 'package:hital_shop/modules/profile/widgets/select_city_widget.dart';
import 'package:hital_shop/modules/profile/widgets/select_province_widget.dart';


class AddAddressPage extends StatelessWidget {
  const AddAddressPage({super.key, this.address});

  final Address? address;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddAddressController>(
      init: AddAddressController(address: address),
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                AppbarWidget(title: address == null ? "ایجاد آدرس" : "ویرایش آدرس",),
                Expanded(
                  child: controller.response == null ? Center(child: CircularProgressIndicator()) :
                  SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: Form(
                      key: controller.formKey,
                      child: Column(
                        children: [
                          TextFieldWidget(
                            controller: controller.txtTitle,
                            hint: "عنوان آدرس",
                            validator: controller.titleValidator,
                          ),
                          SizedBox(height: 15,),
                          Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    FocusScope.of(context).unfocus();
                                    showModalBottomSheet(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(top: Radius.circular(24))
                                      ),
                                      context: context,
                                      builder: (context) => SelectProvinceWidget(
                                        provinces: controller.response!.data!,
                                         onSelected: (province) {
                                           controller.selectProvince(province);
                                         },
                                      ),
                                    );
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(13),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(color: Theme.of(context).dividerColor)
                                    ),
                                    child: Row(
                                      children: [
                                        Text(controller.selectedProvince == null ?
                                        "استان": controller.selectedProvince!.name!, style: TextStyle(color: Theme.of(context).hintColor, fontSize: 17),),
                                        Spacer(),
                                        Icon(CupertinoIcons.chevron_down, color: Theme.of(context).hintColor,)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10,),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    FocusScope.of(context).unfocus();
                                    if(controller.selectedProvince != null) {
                                      showModalBottomSheet(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.vertical(top: Radius.circular(24))
                                        ),
                                        context: context,
                                        builder: (context) => SelectCityWidget(cities: controller.selectedProvince!.cities!, onSelected: (city) {
                                          controller.selectCity(city);
                                        },),
                                      );
                                    }
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(13),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(color: Theme.of(context).dividerColor)
                                    ),
                                    child: Row(
                                      children: [
                                        Text(controller.selectedCity == null ? "شهر" : controller.selectedCity!.name!,
                                          style: TextStyle(color: Theme.of(context).hintColor, fontSize: 17),),
                                        Spacer(),
                                        Icon(CupertinoIcons.chevron_down, color: Theme.of(context).hintColor,)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15,),
                          TextFieldWidget(
                            controller: controller.txtAddress,
                            hint: "آدرس",
                            validator: controller.addressValidator,
                          ),
                          SizedBox(height: 15,),
                          TextFieldWidget(
                            hint: "کدپستی",
                            type: TextInputType.number,
                            controller: controller.txtPostalCode,
                          ),
                          SizedBox(height: 15,),
                          GestureDetector(
                            onTap: () => Get.to(MapPage(onSelected: (latlong) {
                              FocusScope.of(context).unfocus();
                              controller.selectLocation(latlong);
                            },)),
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(13),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: Theme.of(context).dividerColor)
                              ),
                              child: Text(controller.selectedLocation != null ? "موقعیت مکانی انتخاب شد" :
                              "انتخاب موقعیت مکانی روی نقشه", style: TextStyle(color: Theme.of(context).hintColor, fontSize: 17),),
                            ),
                          ),
                          SizedBox(height: 20,),
                          ButtonWidget(text: address == null ? "افزودن آدرس" : "ویرایش آدرس",
                            onPressed: address != null ? controller.editAddress : controller.addAddress,)
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

