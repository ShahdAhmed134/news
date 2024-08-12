import 'package:flutter/material.dart';
import 'package:news/colors.dart';
import 'package:news/home/news/news_item.dart';
import 'package:news/model/NewsResponse.dart';
import 'package:news/model/SourceResponse.dart';
import 'package:news/model/api_manager.dart';

class NewsWidget extends StatefulWidget {
  Source source;

  NewsWidget({required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse?>(
        future: ApiManager.getNews(widget.source.id ?? ''),
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
                      ApiManager.getNews(widget.source.id ?? '');
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
                          ApiManager.getNews(widget.source.id ?? '');
                          setState(() {});
                        },
                        child: Text('try again'))
                  ],
                ),
              ),
            );
          }
          var newList = snapshot.data!.articles!;
          return ListView.builder(
            itemBuilder: (context, index) {
              return NewsItem(news: newList[index]);
            },
            itemCount: newList.length,
          );
        });
  }
}
