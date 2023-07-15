import 'package:flutter/material.dart';
import 'package:get/get.dart';

void successMessage(String message) {
  Get.snackbar("موفق", message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
    margin: EdgeInsets.only(bottom: 20, right: 20, left: 20),
    colorText: Colors.white
  );
}

void errorMessage(String message) {
  Get.snackbar("ناموفق", message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      margin: EdgeInsets.only(bottom: 20, right: 20, left: 20),
      colorText: Colors.white
  );
}