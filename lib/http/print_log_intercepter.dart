import 'package:dio/dio.dart';
import 'package:flutter_application_1/repository/appSettings.dart';

class PrintLogIntercepter extends InterceptorsWrapper {

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers["Authorization"] = "Bearer ${Global.prefs.getString('token')}";
    print("请求地址：${options.baseUrl + options.path}");
    print("请求头：${options.headers}");
    print("请求方法：${options.method}");
    print("请求参数：${options.data}");
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print("响应头：${response.headers}");
    print("响应数据：${response.data}");
    super.onResponse(response, handler);
  }
}