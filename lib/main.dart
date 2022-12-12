import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/homepage.dart';
import 'package:flutter_application_1/views/introduction_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) => MaterialApp(
        title: 'Etsy',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const IntroductionScreen(),
      ),
    );
  }
}
