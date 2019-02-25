/**
 * 布局
 */

import 'package:flutter/material.dart';

class BaseLayout extends StatelessWidget {
  final Widget title;
  final Widget body;

  BaseLayout({ this.body, this.title });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: title,
      ),
      body: body,
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('首页')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('我的')
          )
        ],
      ),
    );
  }
}