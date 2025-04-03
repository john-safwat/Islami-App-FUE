import 'package:flutter/material.dart';
import 'package:islami_app_fue/core/routs/app_routs.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3)).then((_){
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, AppRouts.onBoarding);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Row(),
            Expanded(
              child: Image.asset(
                "assets/images/app_logo.png",
                width: MediaQuery.of(context).size.width * 0.8,
              ),
            ),
            Image.asset(
              "assets/images/branding.png",
              width: MediaQuery.of(context).size.width * 0.5,
            ),
          ],
        ),
      ),
    );
  }
}
