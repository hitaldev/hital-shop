import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hital_shop/backend/repositories/auth_repository.dart';
import 'package:hital_shop/helpers/user_helper.dart';
import 'package:hital_shop/modules/home/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  TextEditingController txtMobile = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  bool isLoading = false;
  AuthRepository authRepository = AuthRepository();

  final form = GlobalKey<FormState>();
  SharedPreferences? prefs;

  Future<void> initShared() async {
    prefs = await SharedPreferences.getInstance();
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

  Future<void> login() async {
    if(form.currentState!.validate()) {
      isLoading = true;
      update();
      var res = await authRepository.login(mobile: txtMobile.text, password: txtPassword.text);
      if(res != null) {
        prefs!.setString("token", res.token!);
        Get.put(UserHelper(res.token!));
        Get.to(HomePage());
      }
      isLoading = false;
      update();
    } else {
      print("not validate");
    }
  }

  @override
  void onInit() {
    initShared();
    super.onInit();
  }

}