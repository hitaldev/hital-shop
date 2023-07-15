import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:hital_shop/helpers/theme_helper.dart';
import 'package:hital_shop/modules/auth/pages/splash_page.dart';

void main() {
  runApp(const MainWidget());
}

class MainWidget extends StatelessWidget {
  const MainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeHelper>(
      init: ThemeHelper(),
      builder: (controller) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Hital Shop",
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate
          ],
          supportedLocales: [
            Locale("fa", "IR")
          ],
          locale: Locale("fa", "IR"),
          theme: controller.defaultTheme,
          home: SplashPage(),
        );
      }
    );
  }
}

