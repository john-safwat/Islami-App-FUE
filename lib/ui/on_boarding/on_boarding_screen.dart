import 'package:flutter/material.dart';
import 'package:islami_app_fue/ui/on_boarding/widgets/bottom_action_bar.dart';
import 'package:islami_app_fue/ui/on_boarding/widgets/onboarding_page.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Image.asset(
              "assets/images/header_logo.png",
              width: MediaQuery.of(context).size.width * 0.7,
            ),
            Expanded(
              child: PageView(
                controller: pageController,
                children: [
                  OnboardingPage(
                    imagePath: "assets/images/onBoarding1.png",
                    title: "Welcome To Islmi App",
                  ),
                  OnboardingPage(
                    imagePath: "assets/images/onBoarding2.png",
                    title: "Welcome To Islami",
                    description: "We Are Very Excited To Have You In Our Community",
                  ),
                  OnboardingPage(
                    imagePath: "assets/images/onBoarding3.png",
                    title: "Reading the Quran",
                    description: "Read, and your Lord is the Most Generous",

                  ),
                  OnboardingPage(
                    imagePath: "assets/images/onBoarding4.png",
                    title: "Bearish",
                    description: "Praise the name of your Lord, the Most High",
                  ),
                  OnboardingPage(
                    imagePath: "assets/images/onBoarding5.png",
                    title: "Holy Quran Radio",
                    description: "You can listen to the Holy Quran Radio through the application for free and easily",
                  ),
                ],
              ),
            ),
            BottomActionBar(
              pageController: pageController,
            ),
          ],
        ),
      ),
    );
  }
}
