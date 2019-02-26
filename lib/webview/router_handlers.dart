import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import './webview.dart';

final webview = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new WebviewPage();
  },
);