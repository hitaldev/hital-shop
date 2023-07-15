import 'package:get/get.dart';
import 'package:hital_shop/helpers/user_helper.dart';
import 'package:hital_shop/modules/auth/pages/start_page.dart';
import 'package:hital_shop/modules/home/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  SharedPreferences? prefs;

  Future<void> initShared() async {
    prefs = await SharedPreferences.getInstance();
    Future.delayed(Duration(seconds: 2)).then((value) {
      if(prefs!.getString("token") != null) {
        Get.put(UserHelper(prefs!.getString("token")));
        Get.off(HomePage());
      } else {
        Get.off(StartPage());
      }
    });
  }

  @override
  void onInit() {
    initShared();
    super.onInit();
  }
}