import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import '../common/models/action.dart';
import '../common/constants/request_status.dart' as requestStatus;

import './service.dart' as listService;

// action 类型
enum _ActionTypes {
  FETCH_LIST_START,
  FETCH_LIST_SUCCESS,
  FETCH_LIST_FAILED,

  FETCH_DETAIL_START,
  FETCH_DETAIL_SUCCESS,
  FETCH_DETAIL_FAILED,
}

// 加载列表
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

// 加载详情
ThunkAction fetchDetail(String id) {
  return (Store store) async {
    try {
      store.dispatch(
        Action(
          type: _ActionTypes.FETCH_DETAIL_START,
        )
      );

      final response = await listService.fetchDetail(id);

      store.dispatch(
        Action(
          type: _ActionTypes.FETCH_DETAIL_SUCCESS,
          payload: response.data['data']
        )
      );
    } catch(e) {
      store.dispatch(
        Action(
          type: _ActionTypes.FETCH_DETAIL_FAILED,
        )
      );
    }
  };
}

Map listReducer(Map state, action) {
  final listStore = state['list'];
  final payload = action.payload;

  switch(action.type) {
    case _ActionTypes.FETCH_LIST_START:
      listStore.status = requestStatus.pending;
      return state;
    case _ActionTypes.FETCH_LIST_SUCCESS:
      listStore.status = requestStatus.success;
      listStore.list.addAll(payload['list']);
      listStore.pagination.pageIndex = listStore.pagination.pageIndex + 1;
      listStore.pagination.total = payload['total'];
      return state;
    case _ActionTypes.FETCH_LIST_FAILED:
      listStore.status = requestStatus.failed;
      return state;
    default:
      return state;
  }
}

Map listItemReducer(Map state, action) {
  final listItemStore = state['listItem'];
  final payload = action.payload;

  switch(action.type) {
    case _ActionTypes.FETCH_DETAIL_START:
      listItemStore.status = requestStatus.pending;
      return state;
    case _ActionTypes.FETCH_DETAIL_SUCCESS:
      listItemStore.status = requestStatus.success;
      listItemStore.data = payload;
      return state;
    case _ActionTypes.FETCH_DETAIL_FAILED:
      listItemStore.status = requestStatus.failed;
      return state;
    default:
      return state;
  }
}