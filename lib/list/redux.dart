import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import '../common/models/action.dart';
import '../common/enums/request_data_status.dart';

import './service.dart' as listService;

// action 类型
enum _ActionTypes {
  FETCH_LIST_START,
  FETCH_LIST_SUCCESS,
  FETCH_LIST_FAILED,
}

// load user list action
ThunkAction fetchList([Map query]) {
  return (Store store) async {
    try {
      store.dispatch(
        Action(
          type: _ActionTypes.FETCH_LIST_START,
        )
      );

      final response = await listService.fetchList(query);

      store.dispatch(
        Action(
          type: _ActionTypes.FETCH_LIST_SUCCESS,
          payload: response.data['data']
        )
      );
    } catch(e) {
      store.dispatch(
        Action(
          type: _ActionTypes.FETCH_LIST_FAILED,
        )
      );
    }
  };
}


/// user reducer
Map reducer(Map state, action) {
  final userStore = state['user'];
  final listStore = userStore['list'];
  final payload = action.payload;

  // 加载用户列表开始
  if (action.type == _ActionTypes.FETCH_LIST_START) {
    listStore['status'] = RequestDataStatus.PENDING;
    listStore['loading'] = true;
    return state;
  }

  // 加载用户列表成功
  if (action.type == _ActionTypes.FETCH_LIST_SUCCESS) {
    listStore['status'] = RequestDataStatus.SUCCESS;
    listStore['loading'] = false;
    listStore['data'].addAll(payload['list']);
    listStore['pagination']['page_index'] = listStore['pagination']['page_index'] + 1;
    listStore['pagination']['total'] = payload['total'];
    return state;
  }

  // 加载用户列表失败
  if (action.type == _ActionTypes.FETCH_LIST_FAILED) {
    listStore['status'] = RequestDataStatus.FAILED;
    listStore['loading'] = false;
    return state;
  }

  return state;
}