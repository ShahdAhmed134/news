import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news/colors.dart';
import 'package:news/home/category/category_details.dart';
import 'package:news/home/home_drawer.dart';
import 'package:news/home/setting/setting.dart';
import 'package:news/model/category.dart';

import 'category/category_fragment.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isSearching = false;
  TextEditingController _searchController = TextEditingController();

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
            title: _isSearching
                ? TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                        fillColor: AppColors.whiteColor,
                        filled: true,
                        hintText: 'Search...',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                    style: TextStyle(color: Colors.black),
                    onChanged: (text) {},
                  )
                : Text(
                    selectedClickMenu == HomeDrawer.setting
                        ? AppLocalizations.of(context)!.setting
                        : selectedCategory == null
                            ? AppLocalizations.of(context)!.newsApp
                            : selectedCategory!.title,
                    style: Theme.of(context).textTheme.titleLarge,
            ),
            /* backgroundColor:
                _isSearching ? Colors.white : Theme.of(context).primaryColor,*/
            actions: [
              IconButton(
                icon: Icon(
                  _isSearching ? Icons.close : Icons.search,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    _isSearching = !_isSearching;
                    if (!_isSearching) {
                      _searchController.clear();
                    }
                  });
                },
              ),
            ],
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
