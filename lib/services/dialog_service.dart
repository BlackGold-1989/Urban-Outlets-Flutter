import 'package:flutter/material.dart';
import 'package:urban_outlets/themes/color_theme.dart';
import 'package:urban_outlets/themes/text_theme.dart';
import 'package:urban_outlets/utils/dimens.dart';

enum SnackBarType { SUCCESS, WARING, INFO, ERROR }

class DialogService {
  final BuildContext context;

  DialogService(this.context);

  void showSnackbar(
      String content,
      GlobalKey<ScaffoldState> _scaffoldKey, {
        SnackBarType type = SnackBarType.SUCCESS,
        Function() dismiss,
        int milliseconds = 2000,
      }) {
    var backgroundColor = Colors.white;
    switch (type) {
      case SnackBarType.SUCCESS:
        backgroundColor = primaryColor;
        break;
      case SnackBarType.WARING:
        backgroundColor = Colors.orangeAccent;
        break;
      case SnackBarType.INFO:
        backgroundColor = blueColor;
        break;
      case SnackBarType.ERROR:
        backgroundColor = Colors.red;
        break;
    }

    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(offsetBase)),
        elevation: 1.0,
        child: Container(
          padding: EdgeInsets.all(offsetBase),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(offsetBase)),
            gradient: getGradientColor(color: backgroundColor),
          ),
          child: Text(
            content,
            style: semiBold.copyWith(fontSize: fontMd, color: Colors.white),
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      duration: Duration(milliseconds: milliseconds),
    ))
        .closed
        .then((value) {
      if (dismiss != null) dismiss();
    });
  }

}