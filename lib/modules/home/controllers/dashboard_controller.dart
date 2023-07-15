import 'package:get/get.dart';
import 'package:hital_shop/backend/repositories/product_repository.dart';
import 'package:hital_shop/backend/response/dashboard_response.dart';

class DashboardController extends GetxController {
  ProductRepository repository = ProductRepository();
  DashboardResponse? dashboardResponse;

  Future<void> getDashboard() async {
    dashboardResponse = await repository.getDashboard();
    update();
  }

  @override
  void onInit() {
    getDashboard();
    super.onInit();
  }
}