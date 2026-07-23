import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:nurserylink/core/constant/constant.dart';
import 'package:nurserylink/core/features/auth/presentation/widgets/contact.dart';
import 'package:nurserylink/core/features/auth/presentation/widgets/loginForm.dart';

String routename = 'login';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Center(
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // logo
                  Container(
                    height: 70.h,
                    width: 70.w,
                    decoration: BoxDecoration(
                      color: AppColors.primay,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Center(child: Lottie.asset('assets/child.json')),
                  ),

                  // title
                  Padding(
                    padding: EdgeInsets.all(10.w),
                    child: Text(
                      'NurseryLink',
                      style: TextStyle(
                        fontSize: AppFonts.large,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primay,
                      ),
                    ),
                  ),

                  // login form
                  Container(
                    height: 500.h,
                    width: 350.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.r),
                      border: Border.all(color: AppColors.black, width: 1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: LoginForm(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            // --------------------------------
                          }
                        },
                        emailController: emailController,
                        passwordController: passwordController,
                      ),
                    ),
                  ),

                  // dont have account
                  Contact(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
