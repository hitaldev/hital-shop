import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hital_shop/helpers/widgets/button_widget.dart';
import 'package:hital_shop/helpers/widgets/text_field_widget.dart';
import 'package:hital_shop/modules/auth/controllers/login_controller.dart';
import 'package:hital_shop/modules/auth/pages/register_page.dart';
import 'package:iconsax/iconsax.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
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
                          child: Text("ورود", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),),
                        ),
                        SizedBox(height: 10,),

                        TextFieldWidget(
                          hint: "شماره موبایل",
                          icon: Iconsax.mobile, type: TextInputType.phone,
                          controller: controller.txtMobile,
                          validator: controller.mobileValidator,
                        ),
                        SizedBox(height: 15,),
                        TextFieldWidget(hint: "رمز عبور",
                          type: TextInputType.visiblePassword,
                          controller: controller.txtPassword,
                          validator: controller.passwordValidator
                        ),
                        SizedBox(height: 25,),
                        ButtonWidget(text: "ورود", onPressed: controller.login, loading: controller.isLoading),
                        SizedBox(height: 15,),
                        GestureDetector(
                          onTap: () => Get.off(RegisterPage()),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("حساب کاربری ندارید؟", style: TextStyle(color: Color(0xFF8C8C8C)),),
                              SizedBox(width: 5,),
                              Text("ثبت نام", style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold, ),),
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
