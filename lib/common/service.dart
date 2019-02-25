import 'package:dio/dio.dart';
import '../common/request.dart';

// 参见：https://github.com/flutterchina/dio/blob/master/README-ZH.md#%E7%A4%BA%E4%BE%8B

Future upload(FormData formData, [Function onSendProgress]) async {
  return await request.post(
    '/upload', 
    data: formData, 
    onSendProgress: onSendProgress
  );
}