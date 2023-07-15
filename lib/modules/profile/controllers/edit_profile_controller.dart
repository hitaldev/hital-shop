import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hital_shop/backend/models/user.dart';
import 'package:hital_shop/backend/repositories/profile_repository.dart';
import 'package:hital_shop/helpers/widgets/snackbar_widget.dart';
import 'package:hital_shop/modules/profile/controllers/profile_controller.dart';

class EditProfileController extends GetxController {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtMobile = TextEditingController();
  TextEditingController txtPasswordOld = TextEditingController();
  TextEditingController txtPasswordNew = TextEditingController();

  ProfileRepository repository = ProfileRepository();

  final formKey = GlobalKey<FormState>();

  final User user;

  EditProfileController(this.user);

  String? nameValidator(String? value) {
    if(value == null || value.isEmpty) {
      return "لطفا نام و نام خانوادگی خود را وارد کنید ";
    }
    return null;
  }

  String? txtOldPasswordValidator(String? value) {
    if(txtPasswordNew.text.isNotEmpty && value!.isEmpty) {
      return "لطفا رمز عبور قبلی را وارد کنید";
    }
    return null;
  }

  String? txtNewPasswordValidator(String? value) {
    if(txtPasswordOld.text.isNotEmpty && value!.isEmpty) {
      return "لطفا رمز عبور جدید را وارد کنید";
    }
    return null;
  }

  Future<void> editProfile() async {
    if(formKey.currentState!.validate()) {
      var res = await repository.editProfile(name: txtName.text, oldPassword: txtPasswordOld.text, newPassword: txtPasswordNew.text);
      if(res) {
        Get.find<ProfileController>().getProfile();
        Get.back();
        successMessage("پروفایل با موفقیت ویرایش شد");
      } else {
        errorMessage("خطایی وجود دارد");
      }
    } else {
      print("not validate");
    }
  }

  @override
  void onInit() {
    txtName.text = user.name ?? "";
    txtMobile.text = user.mobile ?? "";
    super.onInit();
  }
}