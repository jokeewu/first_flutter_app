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
    return Container(
      child: Padding(
        padding: EdgeInsets.only(top: 10.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  onPressed: () {
                    router.navigateTo(context, '/list');
                  },
                  child: Text("列表"),
                ),
                RaisedButton(
                  onPressed: () {
                    router.navigateTo(context, '/form');
                  },
                  child: Text("表单"),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  onPressed: () {
                    router.navigateTo(context, '/upload');
                  },
                  child: Text("文件上传"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
