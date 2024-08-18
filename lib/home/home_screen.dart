import 'package:flutter/material.dart';
import 'package:news/colors.dart';
import 'package:news/home/category/category_details.dart';
import 'package:news/home/home_drawer.dart';
import 'package:news/home/setting/setting.dart';
import 'package:news/home/tabs/tab_widget.dart';
import 'package:news/model/SourceResponse.dart';
import 'package:news/model/api_manager.dart';
import 'package:news/model/category.dart';

import 'category/category_fragment.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: AppColors.whiteColor,
          child: Image.asset(
            'assets/images/pattern.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              selectedClickMenu == HomeDrawer.setting
                  ? 'Setting'
                  : selectedCategory == null
                      ? 'News App'
                      : selectedCategory!.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            centerTitle: true,
          ),
          drawer: Drawer(
            child: HomeDrawer(
              onClickMenu: onClickMenu,
            ),
          ),
          body: selectedClickMenu == HomeDrawer.setting
              ? Setting()
              : selectedCategory == null
                  ? CategoryFragment(
                      onClickCategory: onClickCategory,
                    )
                  : CategoryDetails(
                      category: selectedCategory!,
                    ),
        )
      ],
    );
  }

  Category? selectedCategory;

  void onClickCategory(Category newCategory) {
    selectedCategory = newCategory;
    setState(() {});
  }

  int selectedClickMenu = HomeDrawer.categories;

  void onClickMenu(int newClickMenu) {
    selectedClickMenu = newClickMenu;
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {});
  }
}
