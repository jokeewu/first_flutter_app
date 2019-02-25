import 'package:flutter/material.dart';

import 'package:flutter_redux/flutter_redux.dart';
import './redux.dart' as listRedux;

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('用户列表'),
      ),
      body: StoreConnector(
        converter: (store) => store,
        builder: (context, store) {
          return UserList(store: store);
        }, 
      )
    );
  }
}

class UserList extends StatefulWidget {
  final store;

  UserList({ this.store });

  @override
  _UserListState createState() => _UserListState(store: store);
}

class _UserListState extends State<UserList> {
  final store;

  ScrollController _scrollController = new ScrollController();

  _UserListState({ this.store });

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        final userListStore = store.state['user']['list'];
        final loading = userListStore['loading'];

        if (!loading) {
          store.dispatch(listRedux.fetchList());
        }
      }
    });

    // 进入页面检查是否存在数据
    // 不存在才去加载数据，否则什么也不做
    final list = store.state['user']['list']['data'];
    if (list.length == 0) {
      store.dispatch(listRedux.fetchList());
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userListStore = store.state['user']['list'];
    final list = userListStore['data'];
    final loading = userListStore['loading'];

    if (list.length == 0 && loading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    return ListView.builder(
      itemCount: list.length,
      controller: _scrollController,
      itemBuilder: (context, index) {
        // if (index.isOdd) return Divider();

        // 加载提示
        if (index == list.length - 1) return Padding(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Opacity(
              opacity: loading ? 1.0 : 0,
              child: CircularProgressIndicator(),
            ),
          ),
        );

        return ListTile(
          title: Text(list[index]['full_name']),
        );
      },
    );
  }
}