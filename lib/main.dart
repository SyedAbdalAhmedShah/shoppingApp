import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/introduction_provider.dart';
import 'package:flutter_application_1/provider/products_provider.dart';
import 'package:flutter_application_1/utils/app_colors.dart';
import 'package:flutter_application_1/views/homepage.dart';
import 'package:flutter_application_1/views/introduction_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
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
      builder: (context, orientation, screenType) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => IntroductionProvider()),
          ChangeNotifierProvider(create: (_) => ProductProvider()),
        ],
        child: MaterialApp(
          title: 'Etsy',
          theme: ThemeData(
              colorScheme: ColorScheme.fromSwatch().copyWith(
                  primary: AppColors.primaryColor,
                  secondary: AppColors.bluishColor),
              textTheme: GoogleFonts.montserratTextTheme(TextTheme(
                  // titleSmall:
                  //     TextStyle(color: AppColors.bluishColor, fontSize: 18.sp),
                  // titleMedium:
                  //     TextStyle(color: AppColors.bluishColor, fontSize: 20.sp),
                  // titleLarge:
                  //     TextStyle(color: AppColors.bluishColor, fontSize: 24.sp),
                  headline1: TextStyle(
                      color: AppColors.bluishColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 22.sp)))),
          home: MyHomePage(),
        ),
      ),
    );
  }
}
