import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hital_shop/backend/repositories/profile_repository.dart';
import 'package:hital_shop/backend/response/address_response.dart';
import 'package:hital_shop/backend/response/province_response.dart';
import 'package:hital_shop/helpers/widgets/snackbar_widget.dart';
import 'package:hital_shop/modules/products/controllers/order_controller.dart';
import 'package:hital_shop/modules/profile/controllers/address_contorller.dart';

class AddAddressController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final Address? address;

  TextEditingController txtTitle = TextEditingController();
  TextEditingController txtAddress = TextEditingController();
  TextEditingController txtPostalCode = TextEditingController();

  ProfileRepository repository = ProfileRepository();
  ProvinceResponse? response;

  Province? selectedProvince;
  City? selectedCity;
  String? selectedLocation;

  AddAddressController({this.address});

  Future<void> getProvinces() async {
    response = await repository.getProvinces();
    if(address != null) {
      selectedProvince = response!.data!.firstWhere((element) => element.id == address!.provinceId);
      selectedCity = selectedProvince!.cities!.firstWhere((element) => element.id == address!.cityId);
    }
    update();
  }

  void selectProvince(Province value) {
    selectedProvince = value;
    selectedCity = null;
    update();
  }

  void selectCity(City value) {
    selectedCity = value;
    update();
  }

  void selectLocation(String value) {
    selectedLocation = value;
    update();
  }

  Future<void> addAddress() async {
    if(formKey.currentState!.validate()) {
      if(selectedCity != null) {
        var res = await repository.addAddress(
            title: txtTitle.text,
            cityId: selectedCity!.id!,
            address: txtAddress.text,
            postalCode: txtPostalCode.text,
            latlong: selectedLocation
        );
        if(res) {
          if(Get.isRegistered<AddressController>()) {
            Get.find<AddressController>().getAddresses();
          }
          if(Get.isRegistered<OrderController>()) {
            Get.find<OrderController>().getAddresses();
          }
          Get.back();
          successMessage("آدرس با موفقیت ایجاد شد");
        } else {
          errorMessage("خطایی وجود دارد");
        }
      } else {
        errorMessage("لطفا شهر خود را انتخاب کنید");
      }
    }
  }

  Future<void> editAddress() async {
    if(formKey.currentState!.validate()) {
      if(selectedCity != null) {
        var res = await repository.editAddress(
            address!.id!,
            title: txtTitle.text,
            cityId: selectedCity!.id!,
            address: txtAddress.text,
            postalCode: txtPostalCode.text,
            latlong: selectedLocation
        );
        if(res) {
          Get.find<AddressController>().getAddresses();
          Get.back();
          successMessage("آدرس با موفقیت ویرایش شد");
        } else {
          errorMessage("خطایی وجود دارد");
        }
      } else {
        errorMessage("لطفا شهر خود را انتخاب کنید");
      }
    }
  }

  String? titleValidator(String? value) {
    if(value == null || value.isEmpty) {
      return "لطفا عنوان آدرس را وارد کنید ";
    }
    return null;
  }

  String? addressValidator(String? value) {
    if(value == null || value.isEmpty) {
      return "لطفا آدرس را وارد کنید ";
    }
    return null;
  }

  @override
  void onInit() {
    getProvinces();
    if(address != null) {
      txtTitle.text = address!.title ?? "";
      txtAddress.text = address!.address ?? "";
      txtPostalCode.text = address!.postalCode.toString();
      selectedLocation = address!.latlong;
      update();
    }
    super.onInit();
  }
}