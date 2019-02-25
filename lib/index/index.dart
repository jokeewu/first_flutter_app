import 'package:flutter/material.dart';

import '../home/home.dart';
import '../my/my.dart';

class IndexPage extends StatefulWidget {
  final String title;

  IndexPage({Key key, this.title}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  int _currentTabIndex = 0;
  
  final _navItems = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: Text('首页')
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      title: Text('我的')
    )
  ];
  
  final _widgetOptions = [
    HomePage(),
    MyPage(),
  ];

  final _tabTitles = [
    '首页',
    '我的'
  ];

  void _onTabChange(int index) {
    setState(() {
      _currentTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tabTitles[_currentTabIndex]),
      ),
      body: Container(
        child: _widgetOptions.elementAt(_currentTabIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTabIndex,
        items: _navItems,
        onTap: _onTabChange,
      ),
    );
  }
}
