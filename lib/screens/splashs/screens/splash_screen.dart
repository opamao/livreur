import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/constants.dart';
import '../../../themes/themes.dart';
import '../splashs.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double loadingValue = 0;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      _updateLoadingProgress();
    });
  }

  _updateLoadingProgress() {
    Future.delayed(const Duration(milliseconds: 200), () {
      if (loadingValue >= 1) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const IntroScreen(),
          ),
        );
        return;
      }
      loadingValue += 0.1;
      setState(() {});
      _updateLoadingProgress();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPrimary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              Constants.AppName,
              style: TextStyle(
                color: colorWhite,
                fontWeight: FontWeight.bold,
                fontSize: 25.sp,
              ),
            ),
            Text(
              Constants.sloganApp,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: colorWhite,
                fontWeight: FontWeight.normal,
                fontSize: 15.sp,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
