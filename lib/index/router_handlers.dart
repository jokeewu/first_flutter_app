import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import './index.dart';

final index = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new IndexPage();
  },
);