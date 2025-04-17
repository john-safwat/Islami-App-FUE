import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:islami_app_fue/core/routs/app_routs.dart';
import 'package:islami_app_fue/core/theme/app_theme.dart';
import 'package:islami_app_fue/firebase_options.dart';
import 'package:islami_app_fue/ui/auth/login_screen.dart';
import 'package:islami_app_fue/ui/auth/registration_screen.dart';
import 'package:islami_app_fue/ui/home/home_screen.dart';
import 'package:islami_app_fue/ui/on_boarding/on_boarding_screen.dart';
import 'package:islami_app_fue/ui/splash/splash_screen.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        AppRouts.login :(_) => LoginScreen(),
        AppRouts.registration :(_) => RegistrationScreen(),
        AppRouts.home :(_) => HomeScreen()
      },
      onGenerateInitialRoutes: (initialRoute) => [
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      ],
      initialRoute: AppRouts.login,
    );
  }
}