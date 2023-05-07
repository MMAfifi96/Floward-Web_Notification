import 'package:floward_web_notification/floward_web_view.dart';
import 'package:flutter/material.dart';

class HomeSplashScreen extends StatefulWidget {
  const HomeSplashScreen({Key? key}) : super(key: key);

  @override
  State<HomeSplashScreen> createState() => _HomeSplashScreenState();
}

class _HomeSplashScreenState extends State<HomeSplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration()).then((value) {
      Navigator.pushReplacement<void, void>(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => const FlowardWebView(),
        ),
      );
    });
  }

  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
