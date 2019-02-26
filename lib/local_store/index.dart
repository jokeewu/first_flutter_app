import 'package:flutter/material.dart';

import '../common/router.dart';

class LocalStoreIndex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('本地存储'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('简单存储(key-value)'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              router.navigateTo(context, '/local_store/simple');
            },
          )
        ],
      ),
    );
  }
}