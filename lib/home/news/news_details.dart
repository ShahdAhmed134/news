import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/home/news/news_item.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../colors.dart';

class NewsDetails extends StatelessWidget {
  static const String routeName = 'newsDetails';
  var args;

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)?.settings.arguments as NewArgs;
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
              args.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: CachedNetworkImage(
                      imageUrl: args.image,
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.3,
                      fit: BoxFit.fill,
                      placeholder: (context, url) => Center(
                          child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      )),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          args.author,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          args.description,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          args.data,
                          style: Theme.of(context).textTheme.bodyMedium,
                          textAlign: TextAlign.end,
                        ),
                        Container(
                          padding: EdgeInsets.all(25),
                          margin: EdgeInsets.all(10),
                          color: AppColors.whiteColor,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(args.content),
                              SizedBox(
                                height: 30,
                              ),
                              InkWell(
                                  onTap: _launchURL,
                                  child: Text('view all articale',
                                      textAlign: TextAlign.end,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  _launchURL() async {
    final Uri url = Uri.parse(args.url);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
