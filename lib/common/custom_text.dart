import 'package:flutter/material.dart';

Widget customText(String text,
    {Color? color,
    double? sizes,
    FontWeight? weight,
    int? maxlines,
    TextOverflow? overflow,
    FontStyle? style}) {
  return Text(
    text,
    overflow: overflow,
    style: TextStyle(
      fontStyle: style,
      color: color,
      fontSize: sizes,
      fontWeight: weight,
      overflow: TextOverflow.ellipsis,
    ),
    maxLines: maxlines,
  );
}
