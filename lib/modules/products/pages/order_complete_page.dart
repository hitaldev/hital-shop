import 'package:flutter/material.dart';

class OrderCompletePage extends StatelessWidget {
  const OrderCompletePage({super.key, required this.type, required this.id});

  final String type;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text(type),
            Text(id),
          ],
        ),
      ),
    );
  }
}

