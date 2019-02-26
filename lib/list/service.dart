import '../common/request.dart';

Future fetchList(Map query) async {
  return await request.get('/users');
}

Future fetchDetail(id) async {
  return await request.get('/users/$id');
}
