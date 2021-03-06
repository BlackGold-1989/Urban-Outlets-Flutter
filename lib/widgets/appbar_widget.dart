import 'package:flutter/material.dart';
import 'package:urban_outlets/themes/color_theme.dart';
import 'package:urban_outlets/themes/text_theme.dart';
import 'package:urban_outlets/utils/dimens.dart';

class MainBarWidget extends AppBar {
  final String titleString;
  final Widget titleWidget;
  final Widget titleIcon;
  final Color background;
  final Brightness brightness;

  MainBarWidget({
    Key key,
    this.titleString,
    this.titleWidget,
    this.titleIcon,
    this.background = Colors.white,
    this.brightness = Brightness.light,
    List<IconButton> actions
  })
      : super(
      backgroundColor: background,
      brightness: brightness,
      leading: titleIcon,
      iconTheme: IconThemeData(
          color: primaryColor
      ),
      title: titleWidget == null? Row(
        children: [
          Text(
            titleString,
            style: boldText.copyWith(
                fontSize: fontLg, color: primaryColor),
          ),
        ],
      ) : titleWidget,
      elevation: 1,
      actions: actions);
}