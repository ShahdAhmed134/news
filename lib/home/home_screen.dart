import 'package:flutter/material.dart';
import 'package:news/colors.dart';
import 'package:news/home/tabs/tab_widget.dart';
import 'package:news/model/SourceResponse.dart';
import 'package:news/model/api_manager.dart';

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
              'News App',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            centerTitle: true,
          ),
          body: FutureBuilder<SourceResponse?>(
              future: ApiManager.getSource(),
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
                            ApiManager.getSource();
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
                                ApiManager.getSource();
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
              }),
        )
      ],
    );
  }
}
