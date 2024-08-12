import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news/colors.dart';
import 'package:news/model/NewsResponse.dart';

class NewsItem extends StatelessWidget {
  New news;

  NewsItem({required this.news});

  @override
  Widget build(BuildContext context) {
    DateTime formatted1 =
        DateFormat("yyyy-MM-dd").parse(news.publishedAt ?? '');
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(formatted1);

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              clipBehavior: Clip.antiAlias,
              child: CachedNetworkImage(
                imageUrl: news.urlToImage ?? '',
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.28,
                fit: BoxFit.fill,
                placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                )),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              news.author ?? "",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(
              height: 7,
            ),
            Text(
              news.description ?? "",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '$formatted',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.end,
            )
          ],
        ),
      ),
    );
  }
}
