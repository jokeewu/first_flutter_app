import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import './404.dart';

final notFound = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new NotFoundPage();
  },
);