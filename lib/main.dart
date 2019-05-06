import 'package:flutter/material.dart';

import './news_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> with SingleTickerProviderStateMixin {
  TabController _tabController;
  ScrollController _scrollViewController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 7);
    _scrollViewController = ScrollController(initialScrollOffset: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Color.fromRGBO(210, 210, 210, 1),
            body: NestedScrollView(
              controller: _scrollViewController,
              headerSliverBuilder: (BuildContext context, bool boxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    title: Text(
                      'Cross News',
                      style: TextStyle(color: Colors.black),
                    ),
                    pinned: true,
                    floating: true,
                    forceElevated: boxIsScrolled,
                    backgroundColor: Colors.white,
                    bottom: TabBar(
                      isScrollable: true,
                      labelColor: Colors.black,
                      indicatorColor: Colors.blueAccent,
                      tabs: <Widget>[
                        Tab(text: 'Top'),
                        Tab(text: 'Sports'),
                        Tab(text: 'Science'),
                        Tab(text: 'Entertainment'),
                        Tab(text: 'Technology'),
                        Tab(text: 'Health'),
                        Tab(text: 'Business')
                      ],
                      controller: _tabController,
                    ),
                  )
                ];
              },
              body: TabBarView(
                children: <Widget>[
                  NewsList(category: ''),
                  NewsList(category: 'sports'),
                  NewsList(category: 'science',),
                  NewsList(category: 'entertainment'),
                  NewsList(category: 'technology'),
                  NewsList(category: 'health'),
                  NewsList(category: 'business')
                ],
                controller: _tabController,
              ),
            )));
  }
}
