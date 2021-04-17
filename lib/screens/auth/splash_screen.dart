import 'package:flutter/material.dart';
import 'package:custom_splash/custom_splash.dart';

class SplashScreen extends StatelessWidget {
  final Widget homeWidget;
  const SplashScreen({Key key, this.homeWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150,
              height: 150,
              child: CustomSplash(
                imagePath: 'assets/images/asset_logo.png',
                home: homeWidget,
                duration: 3000,
                type: CustomSplashType.StaticDuration,
                backGroundColor: Colors.white,
                logoSize: 70,
              ),
            )
          ],
        ),
      ),
    );
  }
}
