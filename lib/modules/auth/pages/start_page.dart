import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hital_shop/helpers/widgets/button_widget.dart';
import 'package:hital_shop/modules/auth/pages/login_page.dart';
import 'package:hital_shop/modules/auth/pages/register_page.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F9FF),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Spacer(),
              Image.asset("assets/images/logo.webp", height: 100,),
              Spacer(),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
                  boxShadow: [
                    BoxShadow(color: Color(0xFF000000).withOpacity(0.08), blurRadius: 10, offset: Offset(0, -6))
                  ]
                ),
                child: Column(
                  children: [
                    SizedBox(height: 40,),
                    Text("به فروشگاه ما خوش آمدید", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                    Text("لطفا برای ادامه یکی از گزینه های زیر را انتخاب کنید", style: TextStyle(fontSize: 15),),
                    SizedBox(height: 50,),
                    Row(
                      children: [
                        SizedBox(width: 20,),
                        Expanded(
                          child: ButtonWidget(text: "ثبت نام", onPressed: () {
                            Get.to(RegisterPage());
                          },)
                        ),
                        SizedBox(width: 15,),
                        Expanded(
                            child: ButtonWidget(text: "ورود", onPressed: () {
                              Get.to(LoginPage());
                            },)
                        ),
                        SizedBox(width: 20,),
                      ],
                    ),
                    SizedBox(height: 40,),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
