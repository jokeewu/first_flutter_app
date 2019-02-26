import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_redux/flutter_redux.dart';

import './list.dart';
import './detail.dart';

final list = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new ListPage();
  },
);

final detail = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return StoreConnector(
      converter: (store) => store,
      builder: (context, store) {
        return ListDetailPage(
          store: store, 
          id: params['id'][0]
        );
      }, 
    );
  },
);