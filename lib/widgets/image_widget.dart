import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:urban_outlets/themes/color_theme.dart';

enum IconType {
  SVG,
  PNG,
  ICON
}

class CircleImageWidget extends StatelessWidget {
  final double size;
  final Color backgroundColor;
  final Color color;
  final String iconName;
  final IconData icon;
  final IconType type;

  const CircleImageWidget({
    Key key,
    this.size = 120.0,
    this.backgroundColor = primaryColor,
    this.color = Colors.white,
    this.iconName,
    this.icon,
    this.type = IconType.SVG
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: size, height: size,
        padding: EdgeInsets.all(size / 4),
        decoration: BoxDecoration(
            color: backgroundColor.withOpacity(0.5),
            borderRadius: BorderRadius.all(Radius.circular(size / 2))
        ),
        child: type == IconType.SVG
            ? SvgPicture.asset('assets/icons/ic_verify.svg', width: size / 2, height: size / 2, color: color,)
            : type == IconType.PNG
            ? Image.asset(iconName, width: size / 2, height: size / 2, color: color,)
            : Icon(icon, size: size / 2, color: color,),
    );
  }
}
