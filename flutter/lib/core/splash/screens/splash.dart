import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

String routename = 'spalsh';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, 'page');
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/child.json'),
            const SizedBox(height: 20),
            CircularProgressIndicator(
              color: Colors.black,
              strokeWidth: 1.5,
              backgroundColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
