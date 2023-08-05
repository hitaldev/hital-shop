import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:hital_shop/helpers/scroll_helper.dart';
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
        return Container(
          color: Colors.grey,
          child: Center(
            child: SizedBox(
              width: 600,
              child: GetMaterialApp(
                scrollBehavior: MyCustomScrollBehavior(),
                debugShowCheckedModeBanner: false,
                title: "فروشگاه هیتال",
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
              ),
            ),
          ),
        );
      }
    );
  }
}

