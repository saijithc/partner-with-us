import 'package:flutter/material.dart';

InputDecoration textFieldInputDecoration(
  String hintText, {
  IconButton? icon,
  Icon? prefixicon,
  double? radius,
}) {
  return InputDecoration(
    suffixIcon: icon,
    contentPadding: const EdgeInsets.all(10),
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(radius ??= 5),
    ),
    fillColor: Colors.white.withOpacity(0.9),
    filled: true,
    hintText: hintText,
    labelStyle:
        const TextStyle(color: Colors.black54, fontWeight: FontWeight.w500),
  );
}

TextStyle simpleTextFieldStyle(Color colors) {
  return TextStyle(color: colors);
}
