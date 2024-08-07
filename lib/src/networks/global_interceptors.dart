import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class GlobalInterceptorsClient extends Interceptor {
  BuildContext? context; // Add a reference to the context
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    print("onRequest");
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print("onResponse");
    super.onResponse(response, handler);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    super.onError(err, handler);
  }
}
