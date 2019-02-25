import 'package:flutter/material.dart';
import '../common/router.dart';

class HomePage extends StatefulWidget {

  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      primary: false,
      slivers: <Widget>[
        SliverPadding(
          padding: const EdgeInsets.all(10.0),
          sliver: SliverGrid.count(
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            crossAxisCount: 3,
            children: <Widget>[
              RaisedButton(
                textColor: Colors.white,
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  router.navigateTo(context, '/list');
                },
                child: Text('列表'),
              ),
              RaisedButton(
                textColor: Colors.white,
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  router.navigateTo(context, '/form');
                },
                child: Text('表单'),
              ),
              RaisedButton(
                textColor: Colors.white,
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  router.navigateTo(context, '/upload');
                },
                child: Text('文件上传'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
