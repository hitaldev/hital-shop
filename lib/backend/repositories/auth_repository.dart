import 'package:get/get.dart';
import 'package:hital_shop/backend/repositories/base_repository.dart';
import 'package:hital_shop/backend/response/register_response.dart';
import 'package:hital_shop/helpers/widgets/snackbar_widget.dart';

class AuthRepository extends BaseRepository {

  Future<RegisterResponse?> register({ required String name, required String mobile, required String password, required String passwordConformation }) async {
    var res = await dio.post("/register", data: {
      "name" : name,
      "mobile": mobile,
      "password": password,
      "password_confirmation": passwordConformation
    });
    if(res.statusCode == 200) {
      successMessage("ثبت نام با موفقیت انجام شد");
    } else {
      errorMessage(res.data["message"]);
      return null;
    }
    return RegisterResponse.fromJson(res.data);
  }

  Future<RegisterResponse?> login({ required String mobile, required String password}) async {
    var res = await dio.post("/login", data: {
      "mobile": mobile,
      "password": password,
    });
    if(res.statusCode == 200) {
      successMessage("ورود با موفقیت انجام شد");
    } else {
      errorMessage(res.data["message"]);
      return null;
    }
    return RegisterResponse.fromJson(res.data);
  }

}