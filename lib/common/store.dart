import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import './models/request_data_state.dart';

// reducers
import '../list/redux.dart' as listRedux;

final store = new Store<Map>(
  combineReducers([
    listRedux.listReducer,
    listRedux.listItemReducer,
  ]), 
  initialState: {
    'list': new ListState(),
    'listItem': new DetailState(),
  },
  middleware: [thunkMiddleware]
);