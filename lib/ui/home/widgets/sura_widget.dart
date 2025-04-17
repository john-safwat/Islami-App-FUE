import 'package:flutter/material.dart';
import 'package:islami_app_fue/core/theme/app_colors.dart';
import 'package:islami_app_fue/data/models/quran.dart';

class SuraWidget extends StatelessWidget {
  final Sura sura;

  const SuraWidget({required this.sura, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                "assets/images/aya_number_icon.png",
                height: 64,
              ),
              Text(
                sura.number.toString(),
                style: Theme.of(context).textTheme.titleLarge!
                    .copyWith(color: AppColors.white),
              ),
            ],
          ),
          SizedBox(width: 24),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  sura.nameEn,
                  style: Theme.of(context).textTheme.titleMedium!
                      .copyWith(color: AppColors.white),
                ),
                SizedBox(height: 4),
                Text(
                  "${sura.numberOfAyas} Verses",
                  style: Theme.of(context).textTheme.titleSmall!
                      .copyWith(color: AppColors.white),
                ),
              ],
            ),
          ),
          Text(
            sura.nameAr,
            style: Theme.of(
              context,
            ).textTheme.titleLarge!.copyWith(color: AppColors.white),
          ),
        ],
      ),
    );
  }
}
