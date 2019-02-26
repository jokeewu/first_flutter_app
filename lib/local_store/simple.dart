/// 简单存储
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SimpleLocalStorePage extends StatefulWidget {
  @override
  _SimpleLocalStorePageState createState() => _SimpleLocalStorePageState();
}

class _SimpleLocalStorePageState extends State<SimpleLocalStorePage> {
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  String _key;
  String _value;

  List<Map> _keyValues = new List<Map>();

  @override
  void initState() {
    super.initState();

    _readKeyValuesFromCache();
  }

  _readKeyValuesFromCache() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Set keys = prefs.getKeys();

    _keyValues.clear();
    for (var key in keys) {
      Map t = new Map();
      t[key] = prefs.getString(key);
      _keyValues.add(t);
    }

    setState(() {
      _keyValues = _keyValues;
    });
  }

  void _onSubmit() async {
    var _form = _formKey.currentState;

    if (_form.validate()) {
      _form.save();

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(_key, _value);
      await _readKeyValuesFromCache();
    }
  }

  void _onClearAll() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    setState(() {
      _keyValues = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('简单存储'),
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: '键（key）'
                ),
                validator: (String value) {
                  if (value.isEmpty) {
                    return '请输入键名称';
                  }
                  return null;
                },
                onSaved: (val) {
                  _key = val;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: '值（value）'
                ),
                validator: (String value) {
                  if (value.isEmpty) {
                    return '请输入值';
                  }
                  return null;
                },
                onSaved: (val) {
                  _value = val;
                },
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: RaisedButton(
                        onPressed: _onSubmit,
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.white,
                        child: Text('保存'),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: RaisedButton(
                        onPressed: _onClearAll,
                        child: Text('清除'),
                      ),
                    ),
                  ),
                ],
              ),

              Text(_keyValues.toString()),
            ],
          ),
        ),
      ),
    );
  }
}