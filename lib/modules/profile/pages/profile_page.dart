import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hital_shop/modules/profile/controllers/profile_controller.dart';
import 'package:hital_shop/modules/profile/pages/address_page.dart';
import 'package:hital_shop/modules/profile/pages/edit_profile_page.dart';
import 'package:hital_shop/modules/profile/pages/orders_page.dart';
import 'package:hital_shop/modules/profile/widgets/icon_button_widget.dart';
import 'package:hital_shop/modules/profile/widgets/logout_dialog.dart';
import 'package:iconsax/iconsax.dart';
import 'package:share_plus/share_plus.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (controller) {
        return controller.user == null ? Center(child: CircularProgressIndicator()) :
        SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 20,),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(color: Color(0xFF14489E).withOpacity(0.15), offset: Offset(0, 1), blurRadius: 3)
                  ]
                ),
                child: Column(
                  children: [
                    Container(
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                        color: Color(0xFFE8F1FF),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Icon(Iconsax.user, size: 36,),
                    ),
                    SizedBox(height: 10,),
                    Text(controller.user!.name ?? "", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                    Text(controller.user!.mobile ?? "", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                    SizedBox(height: 10,),
                    GestureDetector(
                      onTap: () => Get.to(EditProfilePage(user: controller.user!,)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Iconsax.edit, size: 20, color: Theme.of(context).primaryColor,),
                          SizedBox(width: 7,),
                          Text("ویرایش",
                            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16, color: Theme.of(context).primaryColor),),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 15,),
              GestureDetector(
                onTap: () => Get.to(AddressPage()),
                child: IconButtonWidget(title: 'آدرس ها', icon: Iconsax.map,)
              ),
              SizedBox(height: 15,),
              GestureDetector(
                onTap: () => Get.to(OrdersPage()),
                child: IconButtonWidget(title: 'سفارشات', icon: Iconsax.graph,),
              ),
              SizedBox(height: 15,),
              GestureDetector(
                onTap: () {
                  Share.share('لطفا اپلیکیشن فروشگاه هیتال را نصب کنید. برای نصب می توانید از لینک استفاده کنید : https://hitaldev.ir');
                },
                child: IconButtonWidget(title: 'دعوت از دوستان', icon: Iconsax.user_cirlce_add,)
              ),
              SizedBox(height: 15,),
              GestureDetector(
                onTap: () {
                  showDialog(context: context, builder: (context) => LogoutDialog(),);
                },
                child: IconButtonWidget(title: 'خروج از حساب', icon: Iconsax.logout,),
              ),
              SizedBox(height: 15,),
            ],
          ),
        );
      }
    );
  }

  @override
  bool get wantKeepAlive => true;
}

