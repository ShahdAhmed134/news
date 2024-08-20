import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news/home/category/category_item.dart';
import 'package:news/model/category.dart';

class CategoryFragment extends StatefulWidget {
  Function onClickCategory;

  CategoryFragment({required this.onClickCategory});

  @override
  State<CategoryFragment> createState() => _CategoryFragmentState();
}

class _CategoryFragmentState extends State<CategoryFragment> {
  @override
  Widget build(BuildContext context) {
    List<Category> categoryList = Category.getCategory(context);
    return Container(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppLocalizations.of(context)!.interest,
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
                        widget.onClickCategory(categoryList[index]);
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
