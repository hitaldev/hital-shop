import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hital_shop/helpers/widgets/button_widget.dart';
import 'package:hital_shop/helpers/widgets/text_field_widget.dart';
import 'package:hital_shop/modules/auth/controllers/register_controller.dart';
import 'package:hital_shop/modules/auth/pages/login_page.dart';
import 'package:iconsax/iconsax.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
      init: RegisterController(),
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: controller.form,
                    child: Column(
                      children: [
                        SizedBox(height: 40,),
                        Image.asset("assets/images/logo_horiz.png", height: 40,),
                        SizedBox(height: 10,),
                        Text("به فروشگاه آنلاین خودتون خوش اومدید",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF8C8C8C)),),
                        SizedBox(height: 30,),
                        Align(
                          alignment: Alignment.topRight,
                          child: Text("ثبت نام", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),),
                        ),
                        SizedBox(height: 10,),
                        TextFieldWidget(hint: "نام و نام خانوادگی", icon: Iconsax.user, controller: controller.txtName, validator: controller.nameValidator),
                        SizedBox(height: 15,),
                        TextFieldWidget(hint: "شماره موبایل", icon: Iconsax.mobile, type: TextInputType.phone, controller: controller.txtMobile, validator: controller.mobileValidator,),
                        SizedBox(height: 15,),
                        TextFieldWidget(hint: "رمز عبور", type: TextInputType.visiblePassword, controller: controller.txtPassword, validator: controller.passwordValidator,),
                        SizedBox(height: 15,),
                        TextFieldWidget(hint: "تکرار رمز عبور", type: TextInputType.visiblePassword, controller: controller.txtPasswordRepeat, validator: controller.passwordRepeatValidator),
                        SizedBox(height: 25,),
                        ButtonWidget(text: "ثبت نام", onPressed: controller.register, loading: controller.loading,),
                        SizedBox(height: 15,),
                        GestureDetector(
                          onTap: () => Get.off(LoginPage()),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("حساب کاربری دارید؟", style: TextStyle(color: Color(0xFF8C8C8C)),),
                              SizedBox(width: 5,),
                              Text("وارد شوید", style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold, ),),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}
