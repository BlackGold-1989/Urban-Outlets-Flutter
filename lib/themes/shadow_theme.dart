import 'package:flutter/material.dart';
import 'package:urban_outlets/themes/color_theme.dart';

BoxShadow containerShadow({
  double offsetX = 2.0,
  double offsetY = 2.0,
  double blurRadius = 3.0,
  Color shadowColor = primaryColor,
}) {
  return BoxShadow(
    color: shadowColor.withOpacity(0.2),
    blurRadius: blurRadius,
    offset: Offset(offsetX, offsetY), // changes position of shadow
  );
}