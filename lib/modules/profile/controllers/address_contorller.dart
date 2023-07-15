import 'package:get/get.dart';
import 'package:hital_shop/backend/repositories/profile_repository.dart';
import 'package:hital_shop/backend/response/address_response.dart';
import 'package:hital_shop/helpers/widgets/snackbar_widget.dart';

class AddressController extends GetxController {
  ProfileRepository repository = ProfileRepository();
  AddressResponse? response;

  Future<void> getAddresses() async {
    response = await repository.getAddresses();
    update();
  }

  Future<void> deleteAddress(int id) async {
    var res = await repository.deleteAddress(id);
    if(res) {
      response!.data!.removeWhere((element) => element.id == id);
      update();
      successMessage("آدرس با موفقیت حذف شد");
    } else {
      errorMessage("خطایی وجود دارد");
    }
  }

  @override
  void onInit() {
    getAddresses();
    super.onInit();
  }
}