import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import './form.dart';

final form = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new FormPage();
  },
);