import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hital_shop/modules/products/controllers/cart_controller.dart';
import 'package:hital_shop/modules/products/pages/order_complete_page.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key, required this.link});

  final String link;

  @override
  Widget build(BuildContext context) {

    var controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onNavigationRequest: (NavigationRequest request) {
            print(request.url);
            if (request.url.contains('order-complete')) {
              var uri = Uri.parse(request.url);
              print(uri.queryParameters["type"]);
              Get.find<CartController>().getCart();
              Get.off(OrderCompletePage(type: uri.queryParameters["type"] ?? "", id: uri.queryParameters["id"] ?? "",));
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(link));

    return SafeArea(child: WebViewWidget(controller: controller));
  }
}
