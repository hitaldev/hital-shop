import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:hital_shop/helpers/user_helper.dart';

class BaseRepository {
  Dio dio = Dio(BaseOptions(
    baseUrl: "https://shop.hitaldev.ir/api",
    validateStatus: (status) => status! < 500,
    headers: {
      "Accept": "application/json",
      if(Get.isRegistered<UserHelper>())
      "Authorization": "Bearer ${Get.find<UserHelper>().token}"
    }
  ));
}