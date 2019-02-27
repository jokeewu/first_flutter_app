import 'package:dio/dio.dart';

final request = new Dio(
  BaseOptions(
    baseUrl: 'http://114.115.128.18:9380/api',
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