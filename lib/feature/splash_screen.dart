import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../app_route.dart';
import '../common/resources/colors.dart';
import '../common/resources/images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 500), () {
      _redirectToDashboard();
    });
  }

  _redirectToDashboard() {
    context.router.pushNamed(routeDashboard);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: getSplash(),
    );
  }

  Widget getSplash() {
    return Container(
      color: KAColors.backgroundColor,
      child: Center(
        child: Image.asset(
          Images.icSplashLogo,
          // width: 400,
          // height: 300,
        ),
      ),
    );
  }
}
