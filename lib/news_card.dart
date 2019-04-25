import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';



class NewsCard extends StatelessWidget{

  final List<dynamic> list;
  final int index;

  NewsCard(this.list, this.index);

  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }



  @override
  Widget build(BuildContext context) {
    return Card(
      child: GestureDetector(
        onTap: () {
          var url = list[index]['url'];
          _launchURL(url);
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