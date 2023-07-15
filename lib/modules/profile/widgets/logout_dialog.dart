import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hital_shop/modules/auth/pages/start_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("خروج از حساب", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: Theme.of(context).primaryColor),),
            Text("آیا از خروج حساب مطمینید؟", style: TextStyle(fontSize: 18),),
            SizedBox(height: 25,),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 6),
                      decoration: BoxDecoration(
                        border: Border.all(color: Theme.of(context).primaryColor),
                        borderRadius: BorderRadius.circular(12)
                      ),
                      child: Center(child: Text("خیر", style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 18),)),
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      SharedPreferences.getInstance().then((value) {
                        value.remove("token");
                        Get.offAll(StartPage());
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 6),
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(12)
                      ),
                      child: Center(child: Text("بله", style: TextStyle(color: Colors.white, fontSize: 18),)),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

