import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget(
      {super.key,
      required this.hint,
      this.icon,
      this.type,
      this.controller,
      this.validator,
      this.disabled = false});

  final String hint;
  final IconData? icon;
  final TextInputType? type;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool disabled;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {

  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      readOnly: widget.disabled,
      keyboardType: widget.type ?? TextInputType.text,
      obscureText: widget.type == TextInputType.visiblePassword ? obscure : false,
      validator: widget.validator,
      decoration: InputDecoration(
        filled: true,
        fillColor: widget.disabled ? Color(0xFFEFEFEF) : Colors.white,
        contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 15),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Theme.of(context).dividerColor)
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: widget.disabled ?
            Theme.of(context).dividerColor
                : Theme.of(context).primaryColor, width: 1.5)
        ),
        hintText: widget.hint,
        suffixIcon: widget.icon != null || widget.type == TextInputType.visiblePassword ?
          GestureDetector(
            onTap: () {
              setState(() {
                obscure = !obscure;
              });
            },
              child: Icon(widget.type != TextInputType.visiblePassword ?  widget.icon : ( obscure ? Iconsax.eye_slash : Iconsax.eye),
                size: 23, color: Theme.of(context).hintColor,)) :
        null
      ),
    );
  }
}
