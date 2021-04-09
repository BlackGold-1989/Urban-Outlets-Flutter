import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:urban_outlets/themes/color_theme.dart';

import 'generated/l10n.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Urban Outlest',
      theme: ThemeData(
          primarySwatch: primaryColor,
          primaryTextTheme:
          TextTheme(headline6: TextStyle(color: primaryColor))),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(
        homeWidget: LoginScreen(),
      ),
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
    );
  }
}