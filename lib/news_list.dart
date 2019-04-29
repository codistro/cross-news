import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './news_card.dart';

class NewsList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NewsListState();
  }
}

class _NewsListState extends State<NewsList> {
  List<dynamic> list = [];

  Future<Null> getNews() async {
    var response = await http.get(
        "https://newsapi.org/v2/top-headlines?country=in&apiKey=95969a234afd445182b47718844222df");

    Map<String, dynamic> result = json.decode(response.body);
    setState(() {
      list = result["articles"];
    });
    return;
  }

  @override
  void initState() {
    getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: getNews,
      displacement: 100.0,
      child: CustomScrollView(slivers: <Widget>[
        SliverAppBar(
            elevation: 0,
            title: Text(
              'Top News',
              style: TextStyle(color: Colors.black),
            ),
            floating: true,
            backgroundColor: Colors.white),
        SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return NewsCard(list, index);
                  },
                  childCount: list.length,
                ),
              )
      ]),
    );
  }
}
