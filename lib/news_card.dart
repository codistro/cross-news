import 'package:flutter/material.dart';

import './news_open.dart';

class NewsCard extends StatelessWidget {
  final List<dynamic> list;
  final int index;

  NewsCard(this.list, this.index);


  @override
  Widget build(BuildContext context) {
    return Card(
      child: GestureDetector(
        onTap: () {
          //var url = list[index]['url'];
          //_launchURL(url);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => NewsOpen(url: list[index]['url'])));
        },
        child: Column(
          children: <Widget>[
            list[index]['urlToImage'] != null
                ? Image.network(list[index]['urlToImage'])
                : Icon(Icons.hourglass_empty),
            Container(
              child: Text(
                list[index]['title'],
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              margin: EdgeInsets.all(10.0),
            ),
          ],
        ),
      ),
    );
  }
}
