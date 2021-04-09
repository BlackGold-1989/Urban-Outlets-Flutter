import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:urban_outlets/utils/consts.dart';
import 'package:urban_outlets/utils/dimens.dart';
import 'package:urban_outlets/widgets/textfield_widget.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        toolbarHeight: 0,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        padding:
            EdgeInsets.symmetric(horizontal: offsetBase, vertical: offsetXSm),
        child: Column(
          children: [
            SvgPicture.asset(
              'assets/images/logo.svg',
              width: 120.0,
              height: 120.0,
            ),
            UnderLineTextField(
              controller: phoneController,
              label: 'Phone Number',
              formatter: [phoneMask],
            ),
          ],
        ),
      ),
    );
  }
}
