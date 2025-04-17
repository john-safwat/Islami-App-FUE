import 'package:flutter/material.dart';
import 'package:islami_app_fue/core/theme/app_colors.dart';

class BaseTabWidget extends StatelessWidget {
  final String imagePath;
  final Widget child;

  const BaseTabWidget({
    required this.imagePath,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.black.withValues(alpha: 0.7),
              AppColors.black.withValues(alpha: 0.8),
              AppColors.black,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/header_logo.png",
                      width: MediaQuery.of(context).size.width * 0.6,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(child: child),
          ],
        ),
      ),
    );
  }
}
