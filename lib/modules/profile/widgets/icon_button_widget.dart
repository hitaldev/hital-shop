import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class IconButtonWidget extends StatelessWidget {
  const IconButtonWidget({super.key, required this.title, required this.icon});

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 55,
      padding: EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Color(0xFF14489E).withOpacity(0.15), offset: Offset(0, 1), blurRadius: 3)
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: Theme.of(context).primaryColor, size: 26),
          SizedBox(width: 14,),
          Text(title, style: TextStyle(fontSize: 18),),
          Spacer(),
          Icon(Iconsax.arrow_left, color: Theme.of(context).primaryColor)
        ],
      ),
    );
  }
}

