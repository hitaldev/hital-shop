import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProductSliderWidget extends StatefulWidget {
  const ProductSliderWidget({super.key, required this.images});

  final List<String> images;

  @override
  State<ProductSliderWidget> createState() => _ProductSliderWidgetState();
}

class _ProductSliderWidgetState extends State<ProductSliderWidget> {

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return
      Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CarouselSlider.builder(
            itemCount: widget.images.length,
            options: CarouselOptions(viewportFraction: 1,
              height: 400, autoPlay: true, autoPlayInterval: Duration(seconds: 3),
              onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            },),
            itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
                Container(
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(widget.images[itemIndex], fit: BoxFit.cover,)
                  ),
                ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(widget.images.length, (index) {
                return AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  width: currentIndex == index ? 30 : 7,
                  height: 7,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: currentIndex == index ? Theme.of(context).primaryColor: Color(0xFFD2D2D2),
                  ),
                  margin: EdgeInsets.only(right: 5),
                );
              }),
            ),
          )
        ],
      );
  }
}
