import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nurserylink/core/constant/constant.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.h),
      child: Text.rich(
        TextSpan(
          text: 'Don\'t have an account? ',
          style: TextStyle(
            fontSize: AppFonts.small,
            fontWeight: FontWeight.w400,
            color: Colors.grey,
          ),
          children: [
            TextSpan(
              text: 'Contact Admin',
              style: TextStyle(
                fontSize: AppFonts.small,
                fontWeight: FontWeight.w400,
                color: AppColors.primay,
                decoration: TextDecoration.underline,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  // --------------------------------
                },
            ),
          ],
        ),
      ),
    );
  }
}
