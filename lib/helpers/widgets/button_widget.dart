import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key, required this.text, this.onPressed, this.loading = false, this.hasBorder = false});

  final String text;
  final Function()? onPressed;
  final bool loading;
  final bool hasBorder;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: hasBorder ? Theme.of(context).scaffoldBackgroundColor : Theme.of(context).primaryColor,
      minWidth: double.infinity,
      height: 45,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: hasBorder ? Theme.of(context).primaryColor : Colors.transparent, width: 1)
      ),
      child: loading ?
      Container(height: 25, width: 25, child: CircularProgressIndicator(color: Colors.white,)):
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if(hasBorder)
           Padding(
             padding: const EdgeInsets.only(left: 8.0),
             child: Icon(Iconsax.add, color: Theme.of(context).primaryColor, size: 26,),
           ),
          Text(text, style: TextStyle(color: hasBorder ? Theme.of(context).primaryColor : Colors.white, fontSize: 17),),
        ],
      ),
      onPressed: loading ? () {} : onPressed
    );
  }
}
