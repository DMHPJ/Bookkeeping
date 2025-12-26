import 'package:dio/dio.dart';
import 'package:flutter_application_1/http/base_model.dart';
import 'package:flutter_application_1/route/routes.dart';
import 'package:oktoast/oktoast.dart';
import 'package:get/get.dart' as get_package;

class ResponseIntercepter extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.statusCode == 200) {
      try {
        var responseData = BaseModel.fromJson(response.data);
        if (responseData.code == 200) {
          handler.next(
            Response(
              requestOptions: response.requestOptions,
              data: responseData,
            ),
          );
        } else if (responseData.code == 401) {
          // 跳转到登录页面
          get_package.Get.toNamed(RoutePath.login);
          showToast(responseData.msg);
          handler.resolve(
            Response(
              requestOptions: response.requestOptions,
              data: responseData,
            ),
          );
        } else {
          // 业务错误，弹出提示
          showToast(responseData.msg);
          handler.next(
            Response(
              requestOptions: response.requestOptions,
              data: responseData,
            ),
          );
        }
      } catch (error) {
        showToast("数据解析异常");
        handler.reject(DioException(
          requestOptions: response.requestOptions,
          error: error,
          type: DioExceptionType.unknown,
        ));
      }
    } else {
      handler.reject(DioException(requestOptions: response.requestOptions));
    }
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    String errorMsg = "网络连接异常";
    
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        errorMsg = "网络连接超时";
        break;
      case DioExceptionType.badResponse:
        final statusCode = err.response?.statusCode;
        if (statusCode != null) {
          errorMsg = "HTTP错误: $statusCode";
        }
        break;
      case DioExceptionType.cancel:
        errorMsg = "请求取消";
        break;
      default:
        errorMsg = err.message ?? "未知网络错误";
    }

    showToast(errorMsg);

    final errorModel = BaseModel(
      code: 500,
      msg: errorMsg,
      data: null,
      type: 'error',
    );
    final response = Response(
      requestOptions: err.requestOptions,
      data: errorModel, 
      statusCode: err.response?.statusCode ?? 500,
      statusMessage: errorMsg,
    );
    handler.resolve(response);
  }
}

extension BaseModelJson on BaseModel {
  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'msg': msg,
      'type': type,
      'data': data,
    };
  }
}
