import 'package:acnoria/features/registration/login/view.dart';
import 'package:acnoria/features/registration/pin/view.dart';
import 'package:acnoria/features/welcamScreen/view.dart';
import 'package:acnoria/shared/styles/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('ar'), // English
        // Locale('es'), // Spanish
      ],
      home: LoginScreen(),
    );
  }
}
