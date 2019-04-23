import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  final List<String> list = List.generate(1000, (index) => 'News $index');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Top 10 News'),
        ),
        body: ListView.builder(itemBuilder: (context, index) {
          return Text(list[index]);
        }),
      ),
    );
  }
}
