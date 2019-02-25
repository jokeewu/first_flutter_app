import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  String _acount;
  String _password;

  void _forSubmitted() {
    var _form = _formKey.currentState;

    if (_form.validate()) {
      _form.save();

      print('$_acount/$_password');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('表单'),
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: '账号/手机号码'
                ),
                validator: (String value) {
                  if (value.isEmpty) {
                    return '请输入账号或手机号码';
                  }
                  return null;
                },
                onSaved: (val) {
                  _acount = val;
                },
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: '密码'
                ),
                validator: (String value) {
                  if (value.isEmpty) {
                    return '请输入密码';
                  }
                  return null;
                },
                onSaved: (val) {
                  _password = val;
                },
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: RaisedButton(
                        onPressed: _forSubmitted,
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.white,
                        child: Text('登陆'),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
