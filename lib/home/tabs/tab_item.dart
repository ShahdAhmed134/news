import 'package:flutter/material.dart';
import 'package:news/colors.dart';
import 'package:news/model/SourceResponse.dart';

class TabItem extends StatelessWidget {
  bool isSelected;
  Source source;

  TabItem({required this.source, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: AppColors.primaryColor, width: 3)),
      child: Text(
        source.name ?? '',
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: isSelected ? AppColors.whiteColor : AppColors.primaryColor),
      ),
    );
  }
}
