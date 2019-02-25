import '../enums/request_data_status.dart';

class PaginationStore {
  final int pageIndex, pageSize, total;

  const PaginationStore({
    this.pageIndex = 0,
    this.pageSize = 20,
    this.total = 0
  });

  PaginationStore.fromJson(Map json)
    : pageIndex = json['page_index'] ?? 0,
      pageSize = json['page_size'] ?? 20,
      total = json['total'] ?? 0;

  Map toJson() {
    return {
      'page_index': pageIndex,
      'page_size': pageSize,
      'total': total
    };
  }
}

class ListStore {
  // 业务数据
  List data;
  // 分页数据
  PaginationStore pagination;
  // 查询数据
  Map query;
  // 请求状态
  dynamic status;
  // 加载状态
  bool get loading => status == RequestDataStatus.PENDING;

  ListStore({ List data, PaginationStore pagination, Map query, dynamic status }) {
    this.data = data ?? [];
    this.pagination = pagination ?? new PaginationStore();
    this.query = query ?? {};
    this.status = status ?? RequestDataStatus.EMPTY;
  }

  ListStore.fromJson(Map json)
    : data = json['data'] ?? [],
      pagination = json['pagination'] ? PaginationStore.fromJson(json['pagination']) : PaginationStore(),
      query = json['query'] ?? {},
      status = json['status'] ?? RequestDataStatus.EMPTY;

  Map toJson() {
    return {
      'data': data,
      'pagination': pagination.toJson(),
      'query': query,
      'status': status,
      'loading': loading
    };
  }
}

class DetailStore {
  Map data;
  Map query;
  dynamic status;
  // 加载状态
  bool get loading => status == RequestDataStatus.PENDING;

  DetailStore({ List data, PaginationStore pagination, Map query, dynamic status }) {
    this.data = data ?? {};
    this.query = query ?? {};
    this.status = status ?? RequestDataStatus.EMPTY;
  }

  DetailStore.fromJson(Map json)
    : data = json['data'] ?? {},
      query = json['query'] ?? {},
      status = json['status'] ?? RequestDataStatus.EMPTY;

  Map toJson() {
    return {
      'data': data,
      'query': query,
      'status': status,
      'loading': loading
    };
  }
}

Map getInitialListStore([Map json]) {
  if (json == null) {
    return new ListStore().toJson();
  }
  return new ListStore.fromJson(json).toJson();
}

Map getInitialDetailStore([Map json]) {
  if (json == null) {
    return new DetailStore().toJson();
  }
  return new DetailStore.fromJson(json).toJson();
}