import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import './common/request.dart' as Request;
import './common/router.dart' as Router;
// redux
import './common/store.dart';

// 欢迎页
import './welcome/welcome.dart';

class App extends StatelessWidget {
  final String title;
  final Store store;

  App({ Key key, this.store, this.title }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new StoreProvider<dynamic>(
      store: store,
      child: MaterialApp(
        title: title,
        theme: ThemeData(
          primarySwatch: Colors.blue
        ),
        home: Scaffold(
          body: WelcomePage(),
        ),
        onGenerateRoute: Router.router.generator,
      ),
    );
  }
}

void main() {
  // http请求配置，如：拦截器等
  Request.init();
  // 路由配置
  Router.init();

  runApp(App(
    title: 'First Flutter App',
    store: store,
  ));
}