import 'package:flutter/material.dart';

import './news_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Color.fromRGBO(200, 200, 200, 1),
          body: NewsList()
      ),
    );
  }
}
