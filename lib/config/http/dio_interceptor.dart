import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

class DioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    super.onRequest(options, handler);

    log('${options.method} => ${options.uri}');
    options.headers.addAll({"Content-Type": "application/json"});

    // if (token != null) {
    //   options.headers.addAll({
    //     "Authorization": "Bearer ${token}",
    //   });
    // }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
    log('${response.statusCode} => ${jsonEncode(response.data)}');
  }
}
