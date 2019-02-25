import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import './upload.dart';

final upload = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new UploadPage();
  },
);