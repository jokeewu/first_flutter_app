import 'package:dio/dio.dart';

final request = new Dio(
  BaseOptions(
    baseUrl: 'http://10.150.20.71:8888/api',
    connectTimeout: 5000,
    receiveTimeout: 3000
  )
);

void init() {
  request.interceptors.add(InterceptorsWrapper(
    onResponse: (Response response) {
      return response;
    }
  ));
}