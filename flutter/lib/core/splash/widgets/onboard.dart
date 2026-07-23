import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nurserylink/core/constant/constant.dart';

class Onboarding extends StatelessWidget {
  final String title;
  final String body;
  final String image;
  const Onboarding({
    super.key,
    required this.title,
    required this.body,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(height: 70.h),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 300.h,
                width: MediaQuery.of(context).size.width * 0.9,
                child: Image.asset(image, fit: BoxFit.cover),
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: AppFonts.large,
                fontWeight: FontWeight.bold,
                color: AppColors.black,
              ),
            ),
            SizedBox(height: 20.h),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Text(
                body,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: AppFonts.medium,
                  fontWeight: FontWeight.normal,
                  color: AppColors.secondary,
                ),
                maxLines: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
