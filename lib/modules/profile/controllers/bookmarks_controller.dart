import 'package:get/get.dart';
import 'package:hital_shop/backend/repositories/profile_repository.dart';
import 'package:hital_shop/backend/response/products_response.dart';

class BookmarksController extends GetxController {
  ProfileRepository repository = ProfileRepository();
  ProductsResponse? response;

  Future<void> getBookmarks() async {
    response = await repository.getBookmarks();
    update();
  }

  Future<void> deleteBookmark(int id) async {
    var res = await repository.bookmark(id);
    if(res) {
      response!.data!.removeWhere((element) => element.id == id);
      update();
    }
  }

  @override
  void onInit() {
    getBookmarks();
    super.onInit();
  }

}