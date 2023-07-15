import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hital_shop/backend/repositories/auth_repository.dart';
import 'package:hital_shop/helpers/user_helper.dart';
import 'package:hital_shop/helpers/widgets/snackbar_widget.dart';
import 'package:hital_shop/modules/home/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterController extends GetxController {

  final form = GlobalKey<FormState>();
  bool loading = false;
  SharedPreferences? prefs;

  Future<void> initShared() async {
    prefs = await SharedPreferences.getInstance();
  }


  AuthRepository authRepository = AuthRepository();

  TextEditingController txtName = TextEditingController();
  TextEditingController txtMobile = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  TextEditingController txtPasswordRepeat = TextEditingController();

  String? nameValidator(String? value) {
    if(value == null || value.isEmpty) {
      return "لطفا نام خود را وارد کنید";
    }
    return null;
  }

  String? mobileValidator(String? value) {
    if(value == null || value.isEmpty) {
      return "لطفا شماره خود را وارد کنید";
    } else if(value.length < 11) {
      return "شماره موبایل باید 11 رقمی باشد";
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if(value == null || value.isEmpty) {
      return "لطفا پسورد را وارد کنید";
    } else if(value.length < 8) {
      return "رمز عبور باید 8 رقمی باشد";
    }
    return null;
  }

  String? passwordRepeatValidator(String? value) {
    if(value == null || value.isEmpty) {
      return "لطفا تکرار پسورد را وارد کنید";
    } else if(value != txtPassword.text) {
      return "تکرار رمز عبور اشتباه است";
    }
    return null;
  }


  Future<void> register() async {
    if(form.currentState!.validate()) {
      loading = true;
      update();
      var res = await authRepository.register(name: txtName.text, mobile: txtMobile.text, password: txtPassword.text, passwordConformation: txtPasswordRepeat.text);
      if(res != null) {
        prefs!.setString("token", res.token!);
        Get.put(UserHelper(res.token!));
        Get.to(HomePage());
      }
      loading = false;
      update();
    }
  }

  @override
  void onInit() {
    initShared();
    super.onInit();
  }
}