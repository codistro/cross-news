import 'package:flutter/material.dart';

import './news_open.dart';

class NewsCard extends StatelessWidget {
  final List<dynamic> list;
  final int index;

  NewsCard(this.list, this.index);

  _getTime(String date) {
    var now = DateTime.now();
    var d = DateTime.parse(date);

    var hours = now.difference(d).inHours;

    if (hours <= 0) {
      return '${now.difference(d).inMinutes} minutes ago';
    }
    return '$hours hours ago';
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.fromLTRB(10, 10, 10, 14),
      child: GestureDetector(
        onTap: () {
          //var url = list[index]['url'];
          //_launchURL(url);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => NewsOpen(url: list[index]['url'])));
        },
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.centerLeft,
              child: Text(
                list[index]['source']['name'],
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            list[index]['urlToImage'] != null
                ? Image.network(list[index]['urlToImage'])
                : Container(),
            Container(
              child: Text(
                list[index]['title'],
                style: TextStyle(color: Colors.blue, fontSize: 16),
              ),
              margin: EdgeInsets.all(10.0),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10.0, 0, 0, 10.0),
              child: Row(
                children: <Widget>[
                  Container(
                    child: Icon(
                      Icons.offline_bolt,
                      color: Colors.blueGrey,
                      size: 20,
                    ),
                    margin: EdgeInsets.fromLTRB(0, 0, 10.0, 0),
                  ),
                  Text(_getTime(list[index]['publishedAt']),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
