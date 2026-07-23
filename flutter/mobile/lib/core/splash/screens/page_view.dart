import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nurserylink/core/constant/constant.dart';
import 'package:nurserylink/core/splash/widgets/onboard.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

String routename = 'page';

class Boarding extends StatefulWidget {
  const Boarding({super.key});

  @override
  State<Boarding> createState() => _BoardingState();
}

class _BoardingState extends State<Boarding> {
  PageController controller = PageController(initialPage: 0);
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            PageView(
              controller: controller,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              children: const [
                // 1st page
                Onboarding(
                  image: 'assets/1.PNG',
                  title: 'Welcome to NurseryLink',
                  body:
                      "Everything you need to stay connected with your child's nursery in one simple and easy-to-use app",
                ),

                // 2nd page
                Onboarding(
                  image: 'assets/2.PNG',
                  title: 'Stay Connected with Your Child',
                  body:
                      "Keep up with your child's daily activities, progress, and important updates from the nursery",
                ),

                // 3rd page
                Onboarding(
                  image: 'assets/3.PNG',
                  title: 'A Better Way to Manage Your Nursery',
                  body:
                      "Manage nursery activities, communicate easily, and keep everything organized in one place.",
                ),
              ],
            ),

            // indicator
            Positioned(
              bottom: 110.h,
              left: 150.w,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SmoothPageIndicator(
                  controller: controller,
                  count: 3,
                  effect: JumpingDotEffect(
                    dotHeight: 16,
                    dotWidth: 16,
                    jumpScale: .7,
                    verticalOffset: 15,
                  ), // your preferred effect
                  onDotClicked: (index) {
                    controller.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
              ),
            ),

            // skip button
            Positioned(
              bottom: 20,
              right: 20,
              child: TextButton(
                onPressed: () {
                  if (currentIndex == 2) {
                    // -----------------------------
                    Navigator.pushNamed(context, 'login');
                  } else {
                    controller.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  }
                },

                child: Text(
                  currentIndex == 2 ? 'Get Started' : 'Skip',
                  style: TextStyle(
                    fontSize: AppFonts.large,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
