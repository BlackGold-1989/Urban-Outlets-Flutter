import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:urban_outlets/generated/l10n.dart';
import 'package:urban_outlets/screens/auth/phone_auth_screen.dart';
import 'package:urban_outlets/services/navigator_service.dart';
import 'package:urban_outlets/utils/consts.dart';
import 'package:urban_outlets/utils/dimens.dart';
import 'package:urban_outlets/widgets/button_widget.dart';
import 'package:urban_outlets/widgets/textfield_widget.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final phoneController = TextEditingController();
  var isEnable = false;

  @override
  void initState() {
    super.initState();

    phoneController.addListener(() {_verifyPhoneNumber();});
  }

  _verifyPhoneNumber() {
    String phone = phoneMask.unmaskText(phoneController.text);
    if (phone.length == 10) {
      isEnable = true;
    } else {
      isEnable = false;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          brightness: Brightness.light,
          toolbarHeight: 0,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Container(
          padding:
              EdgeInsets.symmetric(horizontal: offsetBase, vertical: offsetXSm),
          child: Column(
            children: [
              Spacer(flex: 1,),
              SvgPicture.asset(
                'assets/images/logo.svg',
                width: 150.0,
                height: 150.0,
              ),
              Spacer(flex: 1,),
              UnderLineTextField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                label: S.of(context).phone_number,
                sufficIcon: InkWell(
                  onTap: () {
                    setState(() {
                      phoneController.text = '';
                    });
                  },
                    child: Icon(Icons.cancel)
                ),
                formatter: [phoneMask],
              ),
              SizedBox(height: offsetLg,),
              FullWidthButton(
                title: S.of(context).login,
                action: isEnable? () => _login(): null,
              ),
              Spacer(flex: 3,),
            ],
          ),
        ),
      ),
    );
  }

  _login() async {
    FocusScope.of(context).unfocus();
    NavigatorService(context).pushToWidget(
        screen: PhoneAuthScreen(
          phoneNumber: phoneController.text,
        )
    );
  }

}
