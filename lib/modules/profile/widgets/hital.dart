import 'package:flutter/material.dart';
import 'package:hital_shop/helpers/widgets/button_widget.dart';

  class Counter extends StatefulWidget {
    const Counter({super.key});

    @override
    State<Counter> createState() => _CounterState();
  }

  class _CounterState extends State<Counter> {

    int count = 0;

    @override
    Widget build(BuildContext context) {
      return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(count.toString(),style: TextStyle(fontSize: 70,color: Colors.white),),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Expanded(child: ButtonWidget(text: "اضافه کردن",onPressed: () {
                    count++;
                    setState(() {});
                  },)),
                  SizedBox(width: 20,),
                  Expanded(child: ButtonWidget(text: "کم کردن",onPressed: () {
                    count--;
                    setState(() {});
                  })),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
