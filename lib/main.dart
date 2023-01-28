import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/introduction_provider.dart';
import 'package:flutter_application_1/provider/products_provider.dart';
import 'package:flutter_application_1/utils/app_colors.dart';
import 'package:flutter_application_1/views/homepage.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = "pk_test_51MLXgRBX41Z5Zv6zyySX8STYbrkrqm3KFSEr28Q47aGlseg9uVsuK8hATyeNW9E5psh1a5MHMbQJb2L0yYnUOUGm00J8r7J5PK";
  Stripe.merchantIdentifier = 'merchant.flutter.stripe.test';
  Stripe.urlScheme = 'flutterstripe';
  await Stripe.instance.applySettings();
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
            // useMaterial3: true,

            colorScheme: ColorScheme.fromSwatch().copyWith(primary: AppColors.primaryColor, secondary: AppColors.bluishColor),
            textTheme: GoogleFonts.montserratTextTheme(
              TextTheme(
                headline1: TextStyle(color: AppColors.bluishColor, fontWeight: FontWeight.bold, fontSize: 22.sp),
              ),
            ),
          ),
          home: MyHomePage(),
        ),
      ),
    );
  }
}
