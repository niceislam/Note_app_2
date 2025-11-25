import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    super.key,
    this.hinttext,
    this.fillcolor,
    this.preIcon,
    this.controller,
    this.sufIcon,
    this.filled,
    this.onchanged,
    this.hintStyle,
    this.cursorHeight,
    this.cursorColor,
    this.InTextStyle, this.maxlength,
  });
  final String? hinttext;
  final Color? fillcolor;
  final Icon? preIcon;
  final TextEditingController? controller;
  final Icon? sufIcon;
  final bool? filled;
  final ValueChanged? onchanged;
  final TextStyle? hintStyle;
  final TextStyle? InTextStyle;
  final double? cursorHeight;
  final Color? cursorColor;
  final int? maxlength;

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLength: maxlength,
      onChanged: onchanged,
      controller: controller,
      style:
          InTextStyle ??
          TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
      cursorColor: cursorColor ?? Colors.black,
      cursorHeight: cursorHeight ?? 23,
      decoration: InputDecoration(
        hintStyle: hintStyle ?? TextStyle(color: Colors.grey, fontSize: 18),
        suffixIcon: sufIcon,
        hintText: "${hinttext ?? ""}",
        prefixIcon: preIcon,
        filled: filled ?? false,
        fillColor: fillcolor ?? Colors.grey.withAlpha(320),
        contentPadding: EdgeInsets.zero,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
