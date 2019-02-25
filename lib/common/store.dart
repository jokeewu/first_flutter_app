import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import './models/request_data_state.dart';

// reducers
import '../list/redux.dart' as listRedux;

final store = new Store<Map>(
  combineReducers([
    listRedux.reducer,
  ]), 
  initialState: {
    'user': {
      'list': getInitialListStore(),
      'detail': getInitialDetailStore(),
    },
  },
  middleware: [thunkMiddleware]
);