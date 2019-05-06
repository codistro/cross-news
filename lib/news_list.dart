import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './news_card.dart';

class NewsList extends StatefulWidget {

  final String category;

  NewsList({@required this.category});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NewsListState();
  }
}

class _NewsListState extends State<NewsList>
    with AutomaticKeepAliveClientMixin<NewsList> {
  List<dynamic> list = [];
  String category;

  Future<Null> getNews() async {
    String url = 'https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=95969a234afd445182b47718844222df';
    var response = await http.get(url);

    Map<String, dynamic> result = json.decode(response.body);
    setState(() {
      list = result["articles"];
    });
    return;
  }

  @override
  void initState() {
    category = widget.category;
    getNews();
    super.initState();
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return NewsCard(list, index);
        });
  }
}
