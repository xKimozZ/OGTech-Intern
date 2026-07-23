import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nurserylink/core/constant/constant.dart';
import 'package:nurserylink/core/features/auth/presentation/widgets/customForm.dart';
import 'package:nurserylink/core/features/auth/presentation/widgets/secretForm.dart';

class LoginForm extends StatefulWidget {
  final Function() onTap;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  const LoginForm({
    super.key,
    required this.onTap,
    required this.emailController,
    required this.passwordController,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(10.w),
          child: Text(
            'Welcome Back',
            style: TextStyle(
              fontSize: AppFonts.large,
              fontWeight: FontWeight.w400,
              color: AppColors.black,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(5.w),
          child: Text(
            'Access your account and stay connected with your nursery.',
            style: TextStyle(
              fontSize: AppFonts.small,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
        ),

        // email field
        CustomForm(
          title: 'Email',
          controller: widget.emailController,
          hint: 'name@nursery.com',
          icon: Icons.email,
        ),

        // password field
        SecretForm(
          title: 'Password',
          controller: widget.passwordController,
          hint: '********',
          icon: Icons.visibility_off,
          textInputAction: TextInputAction.done,
        ),

        // forget password
        Padding(
          padding: EdgeInsets.all(10.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  // --------------------------------
                },
                child: Text(
                  'Forget Password?',
                  style: TextStyle(
                    fontSize: AppFonts.small,
                    fontWeight: FontWeight.w400,
                    color: AppColors.primay,
                  ),
                ),
              ),
            ],
          ),
        ),

        // button login
        Padding(
          padding: EdgeInsets.all(10.w),
          child: InkWell(
            onTap: widget.onTap,
            child: Container(
              height: 50.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.primay,
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Center(
                child: Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: AppFonts.medium,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
