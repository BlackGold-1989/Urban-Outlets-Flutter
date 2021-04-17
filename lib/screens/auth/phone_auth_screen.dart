import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:urban_outlets/generated/l10n.dart';
import 'package:urban_outlets/screens/main_screen.dart';
import 'package:urban_outlets/services/dialog_service.dart';
import 'package:urban_outlets/services/load_service.dart';
import 'package:urban_outlets/services/navigator_service.dart';
import 'package:urban_outlets/themes/color_theme.dart';
import 'package:urban_outlets/themes/text_theme.dart';
import 'package:urban_outlets/utils/dimens.dart';
import 'package:urban_outlets/widgets/appbar_widget.dart';
import 'package:urban_outlets/widgets/image_widget.dart';

class PhoneAuthScreen extends StatefulWidget {
  final String phoneNumber;
  final String phone;

  const PhoneAuthScreen({
    Key key,
    @required this.phoneNumber,
    @required this.phone,
  }) : super(key: key);

  @override
  _PhoneAuthScreenState createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  String stringId;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    Timer.run(() {
      _verify();
    });
  }

  void _verify() async {
    LoadService().showLoading(context);

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: widget.phone,
      verificationCompleted: (AuthCredential credential) {
        verifyCompleted(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        LoadService().hideLoading(context);
        if (e.code == 'invalid-phone-number') {
          DialogService(context).showSnackbar('The provided phone number is not valid.',
              _scaffoldKey,
              type: SnackBarType.ERROR);
        }
      },
      codeSent: (String verificationId, [int resendToken]) {
        LoadService().hideLoading(context);

        stringId = verificationId;
        DialogService(context).showSnackbar('Just sent a verification code',
            _scaffoldKey,
            type: SnackBarType.INFO);
      },
      timeout: const Duration(seconds: 60),
      codeAutoRetrievalTimeout: (String verificationId) {
        timeOut(verificationId);
      },
    );
  }

  void verifyCompleted(AuthCredential credential) async {
    await auth.signInWithCredential(credential)
        .whenComplete(() => {
      onMoveNextScene()
    });
  }

  void timeOut(String verificationId) {
    LoadService().hideLoading(context);
    DialogService(context).showSnackbar('Timeout Error.',
        _scaffoldKey,
        type: SnackBarType.ERROR,
      dismiss: () {
        Navigator.of(context).pop();
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
                _checkCode(pin);
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

  _checkCode(String pinCode) async {
    AuthCredential phoneAuthCredential = PhoneAuthProvider.credential(verificationId: stringId, smsCode: pinCode);
    await auth.signInWithCredential(phoneAuthCredential)
        .whenComplete(() => {
      onMoveNextScene()
    });
  }

  void onMoveNextScene() {
    NavigatorService(context).pushToWidget(screen: MainScreen(), replace: true);
  }

}
