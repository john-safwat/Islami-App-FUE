import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami_app_fue/core/theme/app_colors.dart';
import 'package:islami_app_fue/ui/home/tabs/hadith_tab.dart';
import 'package:islami_app_fue/ui/home/tabs/more_tab.dart';
import 'package:islami_app_fue/ui/home/tabs/quran_tab.dart';
import 'package:islami_app_fue/ui/home/tabs/radio_tab.dart';
import 'package:islami_app_fue/ui/home/tabs/sebha_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> tabs = [
    QuranTab(),
    HadithTab(),
    SebhaTab(),
    RadioTab(),
    MoreTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.gold,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.white,
        unselectedItemColor: AppColors.black,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        currentIndex: currentIndex,
        onTap: (index) {
          if (currentIndex == index) return;
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          CustomBottomNavigationBarItem(
            "assets/images/quran_icon.svg",
            currentIndex == 0,
            "Quran",
          ),
          CustomBottomNavigationBarItem(
            "assets/images/hadith_icon.svg",
            currentIndex == 1,
            "Hadith",
          ),
          CustomBottomNavigationBarItem(
            "assets/images/sebha_icon.svg",
            currentIndex == 2,
            "Sebha",
          ),
          CustomBottomNavigationBarItem(
            "assets/images/radio_icon.svg",
            currentIndex == 3,
            "Radio",
          ),
          CustomBottomNavigationBarItem(
            "assets/images/more_icon.svg",
            currentIndex == 4,
            "More",
          ),
        ],
      ),
    );
  }
}

class CustomBottomNavigationBarItem extends BottomNavigationBarItem {
  String imagePath;
  bool isSelected;

  CustomBottomNavigationBarItem(this.imagePath, this.isSelected, String label)
    : super(

        icon: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.black.withValues(alpha: isSelected ? 0.4 : 0),
            borderRadius: BorderRadius.circular(100),
          ),
          child: SvgPicture.asset(
            imagePath,
            color: isSelected ? AppColors.white : AppColors.black,
          ),
        ),
        label: label,
      );
}
