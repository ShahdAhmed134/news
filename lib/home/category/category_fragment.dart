import 'package:flutter/material.dart';
import 'package:news/colors.dart';
import 'package:news/home/category/category_item.dart';
import 'package:news/model/category.dart';

class CategoryFragment extends StatelessWidget {
  List<Category> categoryList = Category.getCategory();
  Function onClickCategory;

  CategoryFragment({required this.onClickCategory});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Pick your category \nof interest",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15),
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        onClickCategory(categoryList[index]);
                      },
                      child: CategoryItem(
                          category: categoryList[index], index: index));
                },
                itemCount: categoryList.length,
              ),
            ),
          )
        ],
      ),
    );
  }
}
