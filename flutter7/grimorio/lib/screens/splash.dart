import 'package:flutter/material.dart';
import 'package:grimorio/screens/dashboard.dart';
import 'package:grimorio/theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int animationTimeInMiliseconds = 2000;
  double imageOpacity = 0;

  void makeOpacityAnimation() {
    setState(() {
      imageOpacity = 1;
    });
    goToNextPageAfterATime();
  }

  void goToNextPageAfterATime() {
    Future.delayed(
      Duration(milliseconds: animationTimeInMiliseconds + 500),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Dashboard()),
        );
      },
    );
  }

  @override
  void initState() {
    makeOpacityAnimation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.modalBackgroundGradient[2],
      body: Center(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Image(
                image: AssetImage('assets/images/grimorio_1152.png'),
                width: 300,
              ),
            ),
            AnimatedOpacity(
              duration: Duration(milliseconds: animationTimeInMiliseconds),
              opacity: imageOpacity,
              curve: Curves.ease,
              child: Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Image(
                  image: AssetImage('assets/images/grimorio_titulo_1152.png'),
                  width: 300,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
