import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: 'https://www.baidu.com',
      appBar: AppBar(
        title: Text('浏览网页'),
      ),
      withZoom: true,
      withLocalStorage: true,
      hidden: true,
      // ???没有loading...
      initialChild: Container(
        color: Colors.redAccent,
        child: const Center(
          child: Text('Waiting.....'),
        ),
      ),
    );
  }
}