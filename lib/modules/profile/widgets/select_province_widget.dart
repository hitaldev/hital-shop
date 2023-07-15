import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hital_shop/backend/response/province_response.dart';

class SelectProvinceWidget extends StatelessWidget {
  const SelectProvinceWidget({super.key, required this.provinces, required this.onSelected});

  final List<Province> provinces;
  final Function(Province province) onSelected;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(25),
      itemCount: provinces.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            onSelected(provinces[index]);
            Get.back();
          },
          child: Container(
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Theme.of(context).primaryColor)
            ),
            child: Center(child: Text(provinces[index].name ?? "")),
          ),
        );
      },
    );
  }
}

