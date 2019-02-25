import '../common/request.dart';

Future fetchList(Map query) async {
  return await request.get('/users');
}

Future fetchDetail(userId) async {
  return await request.get('/users/$userId');
}
