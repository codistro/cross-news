import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsOpen extends StatefulWidget {

  final String url;

  NewsOpen({@required this.url});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NewsOpenState();
  }



}

class _NewsOpenState extends State<NewsOpen>{
  String url;

  @override
  void initState() {
    url = widget.url;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(url, overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 16),),
        backgroundColor: Colors.red,
      ),
      body: WebView(
        initialUrl: this.url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
