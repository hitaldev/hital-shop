import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:hital_shop/backend/repositories/product_repository.dart';
import 'package:hital_shop/backend/repositories/profile_repository.dart';
import 'package:hital_shop/backend/response/address_response.dart';
import 'package:hital_shop/backend/response/cart_response.dart';
import 'package:hital_shop/helpers/widgets/snackbar_widget.dart';
import 'package:hital_shop/modules/products/controllers/cart_controller.dart';
import 'package:hital_shop/modules/products/pages/payment_page.dart';
import 'package:hital_shop/modules/products/widgets/radio_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class OrderController extends GetxController {

  ProfileRepository repository = ProfileRepository();
  ProductRepository productRepository = ProductRepository();
  AddressResponse? response;

  Address? selectedAddress;
  ShippingMethod? selectedMethod;


  Future<void> getAddresses() async {
    response = await repository.getAddresses();
    update();
  }

  void selectAddress(Address value) {
    selectedAddress = value;
    print(selectedAddress!.id);
    update();
  }

  void selectMethod(ShippingMethod value) {
    selectedMethod = value;
    update();
  }

  String getTotalPrice() {
    var totalPrice = Get.find<CartController>().cartResponse!.totalPrice;
    var total = int.parse(totalPrice!.replaceAll(",", ""));
    int shippingPrice = 0;
    if (selectedMethod != null) {
      shippingPrice = int.parse(selectedMethod!.price.replaceAll(",", ""));
    }
    return (total + shippingPrice).toString();
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

  Future<void> order() async {
    if (selectedAddress != null && selectedMethod != null) {
      var link = await productRepository.order(addressId: selectedAddress!.id!, shippingMethod: selectedMethod!.value);
      if(kIsWeb) {
        launchUrlString(link, webOnlyWindowName: "_self");
      } else {
        Get.off(PaymentPage(link: link,));
      }
    } else {
      errorMessage("لطفا همه موارد را انتخاب کنید");
    }
  }

  @override
  void onInit() {
    getAddresses();
    super.onInit();
  }
}