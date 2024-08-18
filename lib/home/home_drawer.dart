import 'package:flutter/material.dart';
import 'package:news/colors.dart';

class HomeDrawer extends StatelessWidget {
  static const int categories = 1;
  static const int setting = 2;
  Function onClickMenu;

  HomeDrawer({required this.onClickMenu});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 40),
            color: AppColors.primaryColor,
            height: MediaQuery.of(context).size.height * 0.17,
            width: double.infinity,
            child: Center(
              child: Text('App News',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontWeight: FontWeight.bold)),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                onClickMenu(categories);
              },
              child: Row(
                children: [
                  Icon(Icons.list, size: 30),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Categories',
                      style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                onClickMenu(setting);
              },
              child: Row(
                children: [
                  Icon(
                    Icons.settings,
                    size: 30,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Settings',
                      style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
