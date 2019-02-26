import 'package:flutter/material.dart';

import './redux.dart' as listRedux;

class ListDetailPage extends StatefulWidget {
  final String id;
  final dynamic store;

  ListDetailPage({ this.id, this.store });

  @override
  _ListDetailPageState createState() => _ListDetailPageState(
    id: id,
    store: store
  );
}

class _ListDetailPageState extends State<ListDetailPage> {
  final String id;
  final dynamic store;

  _ListDetailPageState({ this.id, this.store });

  @override
  void initState() {
    super.initState();
    
    if (id == null) return;

    store.dispatch(listRedux.fetchDetail(id));
  }

  @override
  Widget build(BuildContext context) {
    final listItemStore = store.state['listItem'];
    final listItemData = listItemStore.data;
    final loading = listItemStore.loading;

    return Scaffold(
      appBar: AppBar(
        title: Text('用户详情'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('ID'),
            trailing: Text(listItemData['id'] ?? ''),
          ),
          Divider(),
          ListTile(
            title: Text('姓名'),
            trailing: Text(listItemData['full_name'] ?? ''),
          ),
          Divider(),
          ListTile(
            title: Text('年龄'),
            trailing: Text((listItemData['age'] ?? '').toString()),
          ),
          Divider(),
          ListTile(
            title: Text('邮箱'),
            trailing: Text(listItemData['email'] ?? ''),
          ),
          Divider(),
          ListTile(
            title: Text('地址'),
            trailing: Text(listItemData['address'] ?? ''),
          ),
          Divider(),
        ],
      )
    );
  }
}