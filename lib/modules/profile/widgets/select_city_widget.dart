import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hital_shop/backend/response/province_response.dart';

class SelectCityWidget extends StatelessWidget {
  const SelectCityWidget({super.key, required this.cities, required this.onSelected});

  final List<City> cities;
  final Function(City city) onSelected;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(25),
      itemCount: cities.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            onSelected(cities[index]);
            Get.back();
          },
          child: Container(
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Theme.of(context).primaryColor)
            ),
            child: Center(child: Text(cities[index].name ?? "")),
          ),
        );
      },
    );
  }
}

