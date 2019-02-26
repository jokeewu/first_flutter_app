import '../constants/request_status.dart' as requestStatus;

// 分页
class PaginationState {
  int pageIndex;
  int pageSize;
  int total;

  PaginationState({ int pageIndex, int pageSize, int total }) {
    this.pageIndex = pageIndex ?? 0;
    this.pageSize = pageSize ?? 20;
    this.total = total ?? 0;
  }

  PaginationState.fromJson(Map json)
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

// 列表
class ListState {
  List list;
  PaginationState pagination;
  Map query;
  String status;
  String statusMessage;
  bool get loading => status == requestStatus.pending;

  ListState({ 
    List list, 
    PaginationState pagination, 
    Map query, 
    String status,
    String statusMessage,
  }) {
    this.list = list ?? [];
    this.pagination = pagination ?? new PaginationState();
    this.query = query ?? {};
    this.status = status ?? requestStatus.empty;
    this.statusMessage = statusMessage ?? '';
  }

  ListState.fromJson(Map json)
    : list = json['list'] ?? [],
      pagination = json['pagination'] ? 
        PaginationState.fromJson(json['pagination']) : 
        PaginationState(),
      query = json['query'] ?? {},
      status = json['status'] ?? requestStatus.empty,
      statusMessage = json['statusMessage'] ?? '';

  Map toJson() {
    return {
      'list': list,
      'pagination': pagination.toJson(),
      'query': query,
      'status': status,
      'statusMessage': statusMessage,
      'loading': loading
    };
  }
}

// 详情
class DetailState {
  Map data;
  Map query;
  String status;
  String statusMessage;
  bool get loading => status == requestStatus.pending;

  DetailState({ 
    List data, 
    Map query, 
    String status,
    String statusMessage,
  }) {
    this.data = data ?? {};
    this.query = query ?? {};
    this.status = status ?? requestStatus.empty;
    this.statusMessage = statusMessage ?? '';
  }

  DetailState.fromJson(Map json)
    : data = json['data'] ?? {},
      query = json['query'] ?? {},
      status = json['status'] ?? requestStatus.empty;

  Map toJson() {
    return {
      'data': data,
      'query': query,
      'status': status,
      'loading': loading
    };
  }
}