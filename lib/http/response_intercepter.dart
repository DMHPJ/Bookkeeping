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
        if (responseData.code == 401) {
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
          handler.next(
            Response(
              requestOptions: response.requestOptions,
              data: responseData,
            ),
          );
        }
        // // code == 200 为请求成功
        // if (responseData.code == 200) {
        //   handler.next(
        //     Response(
        //       requestOptions: response.requestOptions,
        //       data: responseData,
        //     ),
        //   );
        // }
        // // code == 201 为 请求成功但无数据
        // else if (responseData.code == 201) {
        //   handler.next(
        //     Response(requestOptions: response.requestOptions, data: true),
        //   );
        // }
        // // code == 500 为 已知的异常
        // else if (responseData.code == 500) {
        //   handler.next(
        //     Response(requestOptions: response.requestOptions, data: responseData.msg),
        //   );
        // }
        // // code == 401 为 未登录
        // else if (responseData.code == 401) {
        //   handler.resolve(response);
        //   showToast(responseData.msg!);
        // }
      } catch (error) {}
    } else {
      handler.reject(DioException(requestOptions: response.requestOptions));
    }
  }
}
