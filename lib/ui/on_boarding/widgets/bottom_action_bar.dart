import 'package:flutter/material.dart';
import 'package:islami_app_fue/core/routs/app_routs.dart';
import 'package:islami_app_fue/core/theme/app_colors.dart';

class BottomActionBar extends StatefulWidget {
  final PageController pageController;

  const BottomActionBar({required this.pageController, super.key});

  @override
  State<BottomActionBar> createState() => _BottomActionBarState();
}

class _BottomActionBarState extends State<BottomActionBar> {
  int currentPage = 0;
  @override
  void initState() {
    super.initState();
    widget.pageController.addListener(() {
      currentPage = widget.pageController.page!.toInt();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            if ((widget.pageController.page ?? 0) != 0)
              TextButton(
                onPressed: () {
                  widget.pageController.animateToPage(
                    widget.pageController.page!.toInt() - 1,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOutCubic,
                  );
                },
                child: const Text("Back"),
              ),
            Spacer(),
            TextButton(
              onPressed: () {
                if(widget.pageController.page?.toInt() == 4){
                  Navigator.pushReplacementNamed(context, AppRouts.login);
                  return;
                }
                widget.pageController.animateToPage(
                  widget.pageController.page!.toInt() + 1,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOutCubic,
                );
              },
              child: Text(
                widget.pageController.page?.toInt() != 4 ? "Next" : "Finish",
              ),
            ),
          ],
        ),
        Positioned.fill(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < 5; i++)
                AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  height: 8,
                  width: currentPage == i ? 32 : 8,
                  margin: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color:
                        currentPage == i
                            ? AppColors.gold
                            : AppColors.gray,
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
