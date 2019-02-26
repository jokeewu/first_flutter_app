import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
// import 'package:flutter_redux/flutter_redux.dart';

import './index.dart';
import './simple.dart';

final index = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new LocalStoreIndex();
  },
);

final simple = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new SimpleLocalStorePage();
  },
);