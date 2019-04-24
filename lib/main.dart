import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
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

  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Top News'),
          backgroundColor: Colors.red,
        ),
        body: RefreshIndicator(
          onRefresh: getNews,
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                child: GestureDetector(
                  onTap: (){
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
            },
            itemCount: list.length,
            padding: EdgeInsets.all(6.0),
          ),
        ),
      ),
    );
  }
}
