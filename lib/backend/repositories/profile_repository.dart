import 'package:hital_shop/backend/models/user.dart';
import 'package:hital_shop/backend/repositories/base_repository.dart';
import 'package:hital_shop/backend/response/address_response.dart';
import 'package:hital_shop/backend/response/products_response.dart';
import 'package:hital_shop/backend/response/province_response.dart';

class ProfileRepository extends BaseRepository {
  Future<User> getProfile() async {
    var res = await dio.get("/profile");
    print(res.data);
    return User.fromJson(res.data["data"]);
  }

  Future<bool> editProfile({ required String name, String? oldPassword, String? newPassword }) async {
    var res = await dio.post("/profile", data: {
      "name": name,
      if(oldPassword != null && oldPassword.isNotEmpty)
        "old_password": oldPassword,
      if(newPassword != null && newPassword.isNotEmpty)
        "new_password": newPassword,
    });
    return res.statusCode == 200;
  }
  
  Future<ProvinceResponse> getProvinces() async {
    var res = await dio.get("/provinces");
    return ProvinceResponse.fromJson(res.data);
  }

  Future<bool> addAddress({required String title, required int cityId, required String address, String? postalCode, String? latlong}) async {
    var res = await dio.post("/address", data: {
      "title": title,
      "city_id": cityId.toString(),
      "address": address,
      "latlong": latlong,
      "postal_code": postalCode
    });
    return res.statusCode == 200;
  }

  Future<AddressResponse> getAddresses() async {
    var res = await dio.get("/address");
    return AddressResponse.fromJson(res.data);
  }

  Future<bool> deleteAddress(int id) async {
    var res = await dio.delete("/address/$id");
    return res.statusCode == 200;
  }

  Future<bool> editAddress(int id, {required String title, required int cityId, required String address, String? postalCode, String? latlong}) async {
    var res = await dio.put("/address/$id", data: {
      "title": title,
      "city_id": cityId.toString(),
      "address": address,
      "latlong": latlong,
      "postal_code": postalCode
    });
    return res.statusCode == 200;
  }

  Future<bool> bookmark(int id) async {
    var res = await dio.post("/product/$id/bookmark");
    return res.statusCode == 200;
  }
  
  Future<ProductsResponse> getBookmarks() async {
    var res = await dio.get("/bookmarks");
    print(res.data);
    return ProductsResponse.fromJson(res.data);
  }
}