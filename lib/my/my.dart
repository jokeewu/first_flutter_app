import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {

  MyPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          ListTile(
            title: Text('我的投票'),
            trailing: Icon(Icons.keyboard_arrow_right)
          ),
          Divider(),
          ListTile(
            title: Text('设置'),
            trailing: Icon(Icons.keyboard_arrow_right)
          ),
          Divider(),
        ],
      ),
    );
  }
}
