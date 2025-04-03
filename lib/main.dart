import 'package:flutter/material.dart';
import 'package:islami_app_fue/core/routs/app_routs.dart';
import 'package:islami_app_fue/core/theme/app_theme.dart';
import 'package:islami_app_fue/ui/on_boarding/on_boarding_screen.dart';
import 'package:islami_app_fue/ui/splash/splash_screen.dart';

void main(){

  runApp(MyApp());

}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      routes: {
        AppRouts.splash :(_) => const SplashScreen(),
        AppRouts.onBoarding :(_) => const OnBoardingScreen(),
      },
      initialRoute: AppRouts.splash,
    );
  }
}