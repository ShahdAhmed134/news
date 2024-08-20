import 'package:flutter/material.dart';
import 'package:news/colors.dart';
import 'package:news/model/category.dart';

import '../../model/SourceResponse.dart';
import '../../model/api_manager.dart';
import '../tabs/tab_widget.dart';

class CategoryDetails extends StatefulWidget {
  Category category;

  CategoryDetails({required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse?>(
        future: ApiManager.getSource(context, widget.category.categoryId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ));
          } else if (snapshot.hasError) {
            return Column(
              children: [
                Text('something wrong'),
                ElevatedButton(
                    onPressed: () {
                      ApiManager.getSource(context, widget.category.categoryId);
                      setState(() {});
                    },
                    child: Text('try again'))
              ],
            );
          }
          if (snapshot.data!.status != 'ok') {
            return Center(
              child: Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(20),
                height: 200,
                decoration: BoxDecoration(
                  color: Color(0xffd9d5d5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Text(snapshot.data!.message!),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          ApiManager.getSource(
                              context, widget.category.categoryId);
                          setState(() {});
                        },
                        child: Text('try again'))
                  ],
                ),
              ),
            );
          }
          var SourceList = snapshot.data!.sources!;
          return TabWidget(sourceList: SourceList);
        });
  }
}