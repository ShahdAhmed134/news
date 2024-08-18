import 'package:flutter/material.dart';
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

  static List<Category> getCategory() {
    return [
      Category(
          categoryId: 'sports',
          imagePath: 'assets/images/sports.png',
          title: 'Sports',
          color: AppColors.redColor),
      Category(
          categoryId: 'general',
          imagePath: 'assets/images/Politics.png',
          title: 'General',
          color: AppColors.darkBlueColor),
      Category(
          categoryId: 'health',
          imagePath: 'assets/images/health.png',
          title: 'Health',
          color: AppColors.pinkColor),
      Category(
          categoryId: 'business',
          imagePath: 'assets/images/bussines.png',
          title: 'Business',
          color: AppColors.brownColor),
      Category(
          categoryId: 'entertainment',
          imagePath: 'assets/images/environment.png',
          title: 'Entertainment',
          color: AppColors.blueColor),
      Category(
          categoryId: 'science',
          imagePath: 'assets/images/science.png',
          title: 'Science',
          color: AppColors.yellowColor),
    ];
  }
}
