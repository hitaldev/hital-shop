import 'package:get/get.dart';
import 'package:hital_shop/backend/models/user.dart';
import 'package:hital_shop/backend/repositories/profile_repository.dart';

class ProfileController  extends GetxController {
  ProfileRepository repository = ProfileRepository();
  User? user;

  Future<void> getProfile() async {
    user = await repository.getProfile();
    update();
  }

  @override
  void onInit() {
    getProfile();
    super.onInit();
  }
}