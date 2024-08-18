import 'package:flutter/material.dart';
import 'package:news/colors.dart';
import 'package:news/home/category/view_model_category_details.dart';
import 'package:news/model/category.dart';
import 'package:provider/provider.dart';

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
  ViewModelCategoryDetails viewModel = ViewModelCategoryDetails();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSources(widget.category.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<ViewModelCategoryDetails>(
        builder: (context, viewModel, child) {
          if (viewModel.errorMessage != null) {
            return Column(
              children: [
                Text(viewModel.errorMessage!),
                ElevatedButton(
                    onPressed: () {
                      viewModel.getSources(widget.category.categoryId);
                    },
                    child: Text('try again'))
              ],
            );
          } else if (viewModel.sourceList == null) {
            return Center(
                child: CircularProgressIndicator(
              color: AppColors.primaryColor,
            ));
          } else {
            return TabWidget(sourceList: viewModel.sourceList!);
          }
        },
      ),
    );
  }
}

/*  FutureBuilder<SourceResponse?>(
        future: ApiManager.getSource(widget.category.categoryId),
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
                      ApiManager.getSource(widget.category.categoryId);
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
                          ApiManager.getSource(widget.category.categoryId);
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
  */
