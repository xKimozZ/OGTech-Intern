import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nurserylink/core/features/auth/presentation/screens/login.dart';
import 'package:nurserylink/core/splash/screens/page_view.dart';
import 'package:nurserylink/core/splash/screens/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          'splash' : (context) => Splash(),
          'page' : (context) => Boarding(),
          'login' : (context) => Login(),
        },
        initialRoute: 'splash',
      ),
    );
  }
}