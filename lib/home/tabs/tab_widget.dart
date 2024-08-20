import 'package:flutter/material.dart';
import 'package:news/home/news/news_widget.dart';
import 'package:news/home/tabs/tab_item.dart';
import 'package:news/model/SourceResponse.dart';

class TabWidget extends StatefulWidget {
  List<Source> sourceList;

  TabWidget({required this.sourceList});

  @override
  State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    if (widget.sourceList.isEmpty) {
      return Center(
        child: Text('No sources available for this language.'),
      );
    }
    return DefaultTabController(
        length: widget.sourceList.length,
        child: Column(
          children: [
            TabBar(
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },
              tabAlignment: TabAlignment.start,
              indicatorColor: Colors.transparent,
              dividerColor: Colors.transparent,
              isScrollable: true,
              tabs: widget.sourceList
                  .map((source) => TabItem(
                      source: source,
                      isSelected:
                          selectedIndex == widget.sourceList.indexOf(source)))
                  .toList(),
            ),
            Expanded(
                child: NewsWidget(source: widget.sourceList[selectedIndex])),
          ],
        ));
  }
}
