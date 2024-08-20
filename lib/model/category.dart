import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news/colors.dart';

class Category {
  String categoryId;
  String imagePath;
  String title;
  Color color;

  Category(
      {required this.categoryId,
      required this.imagePath,
      required this.title,
      required this.color});

  static List<Category> getCategory(BuildContext context) {
    //final provider = Provider.of<AppConfigProvider>(context, listen: false);
    return [
      Category(
          categoryId: 'sports',
          imagePath: 'assets/images/sports.png',
          title: AppLocalizations.of(context)!.sports,
          color: AppColors.redColor),
      Category(
          categoryId: 'general',
          imagePath: 'assets/images/Politics.png',
          title: AppLocalizations.of(context)!.general,
          color: AppColors.darkBlueColor),
      Category(
          categoryId: 'health',
          imagePath: 'assets/images/health.png',
          title: AppLocalizations.of(context)!.health,
          color: AppColors.pinkColor),
      Category(
          categoryId: 'business',
          imagePath: 'assets/images/bussines.png',
          title: AppLocalizations.of(context)!.business,
          color: AppColors.brownColor),
      Category(
          categoryId: 'entertainment',
          imagePath: 'assets/images/environment.png',
          title: AppLocalizations.of(context)!.entertainment,
          color: AppColors.blueColor),
      Category(
          categoryId: 'science',
          imagePath: 'assets/images/science.png',
          title: AppLocalizations.of(context)!.science,
          color: AppColors.yellowColor),
    ];
  }
}
