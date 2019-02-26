import 'package:flutter/material.dart';

import 'package:flutter_redux/flutter_redux.dart';
import './redux.dart' as listRedux;
import '../common/router.dart';

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
        final userListStore = store.state['list'];
        final loading = userListStore.loading;

        if (!loading) {
          store.dispatch(listRedux.fetchList());
        }
      }
    });

    // 进入页面检查是否存在数据
    // 不存在才去加载数据，否则什么也不做

    final list = store.state['list'].list;
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
    final userListStore = store.state['list'];
    final list = userListStore.list;
    final loading = userListStore.loading;

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

        final listItem = list[index];
        final fullName = listItem['full_name'];
        final id = listItem['id'];

        return ListTile(
          title: Text(fullName),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            router.navigateTo(context, '/list/$id');
          },
        );
      },
    );
  }
}