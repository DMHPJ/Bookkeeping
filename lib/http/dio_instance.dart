import 'package:dio/dio.dart';
import 'package:flutter_application_1/http/http_method.dart';
import 'package:flutter_application_1/http/print_log_intercepter.dart';
import 'package:flutter_application_1/http/response_intercepter.dart';

class DioInstance {
  static DioInstance? _instance;

  DioInstance._();

  static DioInstance instance() {
    return _instance ??= DioInstance._();
  }

  final Dio _dio = Dio();

  final Duration _defaultTime = const Duration(seconds: 30);

  void initDio({
    required String baseUrl,
    String? httpMethod,
    Duration? connectTimeout,
    Duration? receiveTimeout,
    Duration? sendTimeout,
    ResponseType? responseType = ResponseType.json,
    String? contentType,
  }) {
    _dio.options = BaseOptions(
      baseUrl: baseUrl,
      method: httpMethod,
      connectTimeout: connectTimeout ?? _defaultTime,
      receiveTimeout: receiveTimeout ?? _defaultTime,
      sendTimeout: sendTimeout ?? _defaultTime,
      responseType: responseType,
      contentType: contentType,
    );
    // 请求消息日志拦截器
    _dio.interceptors.add(PrintLogIntercepter());
    // 返回值统一处理拦截器
    _dio.interceptors.add(ResponseIntercepter());
  }

  // get请求
  Future<Response> get({
    required String path,
    Map<String, dynamic>? parma,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    return await _dio.get(
      path,
      queryParameters: parma,
      options:
          options ??
          Options(
            method: HttpMethod.GET,
            receiveTimeout: _defaultTime,
            sendTimeout: _defaultTime,
          ),
      cancelToken: cancelToken,
    );
  }

  // post请求
  Future<Response> post({
    required String path,
    Object? data,
    Map<String, dynamic>? parma,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    return await _dio.post(
      path,
      queryParameters: parma,
      data: data,
      options:
          options ??
          Options(
            method: HttpMethod.POST,
            receiveTimeout: _defaultTime,
            sendTimeout: _defaultTime,
          ),
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }
}
