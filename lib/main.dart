import 'package:flutter/material.dart';
import 'package:onboarding_concept/screens/onboarding/onboarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Onboarding Concept',
      home: Builder(builder: (BuildContext context) {
        var screenHeight = MediaQuery.of(context).size.height;
        return Onboarding(
          screenHeight: screenHeight,
        );
      }),
    );
  }
}
