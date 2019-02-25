import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import './list.dart';
import './detail.dart';

final list = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new ListPage();
  },
);

final detail = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new UserDetailPage();
  },
);