import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami_app_fue/core/theme/app_colors.dart';
import 'package:islami_app_fue/data/models/quran.dart';
import 'package:islami_app_fue/ui/home/widgets/base_tab_widget.dart';
import 'package:islami_app_fue/ui/home/widgets/sura_widget.dart';

class QuranTab extends StatelessWidget {
  QuranTab({super.key});

  List<Sura> surasList = Sura.generateSurasList();

  @override
  Widget build(BuildContext context) {
    return BaseTabWidget(
      imagePath: "assets/images/quran_bg.png",
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  hintText: "Search",
                  fillColor: AppColors.black.withValues(alpha: 0.6),
                  prefixIcon: Container(
                    padding: EdgeInsets.all(8),
                    child: SvgPicture.asset(
                      "assets/images/quran_icon.svg",
                      color: AppColors.gold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverList.separated(
            itemBuilder: (context, index) {
              return SuraWidget(sura: surasList[index]);
            },
            separatorBuilder:
                (context, index) =>
                    Divider(indent: 40, endIndent: 40, color: AppColors.white),
            itemCount: surasList.length,
          ),
        ],
      ),
    );
  }
}
