import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:urban_outlets/generated/l10n.dart';
import 'package:urban_outlets/screens/main_screen.dart';
import 'package:urban_outlets/services/navigator_service.dart';
import 'package:urban_outlets/themes/color_theme.dart';
import 'package:urban_outlets/themes/text_theme.dart';
import 'package:urban_outlets/utils/dimens.dart';
import 'package:urban_outlets/widgets/appbar_widget.dart';
import 'package:urban_outlets/widgets/image_widget.dart';

class PhoneAuthScreen extends StatefulWidget {
  final String phoneNumber;

  const PhoneAuthScreen({
    Key key,
    @required this.phoneNumber
  }) : super(key: key);

  @override
  _PhoneAuthScreenState createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainBarWidget(
        titleString: S.of(context).verification_code,
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: offsetBase, vertical: offsetSm),
        child: Column(
          children: [
            SizedBox(height: offsetLg,),
            CircleImageWidget(
              iconName: 'assets/icons/ic_verify.svg',
              backgroundColor: Colors.green,
            ),
            SizedBox(height: offsetXLg,),
            Text(S.of(context).verify_description + ' ${widget.phoneNumber}',
              style: mediumText.copyWith(fontSize: fontMd),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: offsetXLg,),
            OTPTextField(
              length: 6,
              width: MediaQuery.of(context).size.width - offsetLg * 2,
              textFieldAlignment: MainAxisAlignment.spaceAround,
              fieldWidth: 48,
              fieldStyle: FieldStyle.underline,
              style: mediumText.copyWith(fontSize: 36.0),
              onChanged: (pin) {
                print("Changed: " + pin);
              },
              onCompleted: (pin) {
                _checkCode();
              },
            ),
            SizedBox(height: offsetXLg,),
            Text(S.of(context).not_code,
              style: mediumText.copyWith(fontSize: fontMd),
            ),
            SizedBox(height: offsetSm,),
            Text(S.of(context).resend_cdoe,
              style: semiBold.copyWith(fontSize: fontMd, color: primaryColor),
            ),
          ],
        ),
      ),
    );
  }

  _checkCode() async {
    NavigatorService(context).pushToWidget(screen: MainScreen(), replace: true);
  }

}
