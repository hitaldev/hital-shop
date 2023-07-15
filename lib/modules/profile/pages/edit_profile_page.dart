import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hital_shop/backend/models/user.dart';
import 'package:hital_shop/helpers/widgets/appbar_widget.dart';
import 'package:hital_shop/helpers/widgets/button_widget.dart';
import 'package:hital_shop/helpers/widgets/text_field_widget.dart';
import 'package:hital_shop/modules/profile/controllers/edit_profile_controller.dart';
import 'package:iconsax/iconsax.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditProfileController>(
      init: EditProfileController(user),
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  AppbarWidget(title: "ویرایش پروفایل",),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        SizedBox(height: 20,),
                        TextFieldWidget(
                          hint: "نام و نام خانوادگی",
                          icon: Iconsax.user,
                          controller: controller.txtName,
                          validator: controller.nameValidator,
                        ),
                        SizedBox(height: 15,),
                        TextFieldWidget(hint: "۰۹۱۳۰۰۱۰۱۰۱", icon: Iconsax.mobile,
                          disabled: true, controller: controller.txtMobile,),
                        SizedBox(height: 15,),
                        TextFieldWidget(
                          hint: "رمز عبور قبلی",
                          type: TextInputType.visiblePassword,
                          controller: controller.txtPasswordOld,
                          validator: controller.txtOldPasswordValidator,
                        ),
                        SizedBox(height: 15,),
                        TextFieldWidget(
                          hint: "رمز عبور جدید",
                          type: TextInputType.visiblePassword,
                          controller: controller.txtPasswordNew,
                          validator: controller.txtNewPasswordValidator,
                        ),
                        SizedBox(height: 25,),
                        ButtonWidget(text: "ویرایش", onPressed: () {
                          controller.editProfile();
                        },)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}

