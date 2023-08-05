import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hital_shop/modules/auth/controllers/splash_controller.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                Image.asset("assets/images/background.webp",
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                  opacity: AlwaysStoppedAnimation(0.45),
                ),
                Center(
                  child: Image.asset("assets/images/logo.webp", height: 100,)
                )
              ],
            ),
          ),
        );
      }
    );
  }
}
