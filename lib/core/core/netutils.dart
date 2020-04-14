import 'dart:async';
import 'package:dio/dio.dart';
import 'package:pe_app/core/configuration/app_config.dart';
import 'package:pe_app/core/models/request_model.dart';

import 'interceptor.dart';

class NetUtils {
  static Dio dio;
  NetUtils.Init() {
    dio = new Dio();
    dio.options.baseUrl = AppConfig.apiBaseUrl;
    dio.options.sendTimeout = AppConfig.apiRequestTimeout;
    dio.interceptors.add(InterceptorManager());
  }

  static _buildRequestModelSuccess(Response response) {
    RequestModel model = new RequestModel();
    model.Code = response.statusCode;
    model.ExceptionMessage = null;
    model.ExceptionType = null;
    model.Message = "success";
    model.State = true;
    model.RequestData = response.data;
    return model;
  }

  static _buildRequestModelFail(DioError err) {
    RequestModel model = new RequestModel();
    model.Code = 600;
    model.ExceptionMessage = err.response.data["ExceptionMessage"];
    model.ExceptionType = err.type;
    model.Message = err.response.data["Message"];
    model.State = false;
    model.RequestData = null;
    return model;
  }

  static Future _delegate(String action, callback) async {
    try {
      print('*************************$action 请求启动*************************');
      var response = await callback() as Response;
      return _buildRequestModelSuccess(response);
    } on DioError catch (e) {
      if (e.response != null) {
        print('$action 请求发生错误：${e.response.data["ExceptionMessage"]}');
      } else {
        print('$action 请求发生错误：${e.error}');
      }
      return _buildRequestModelFail(e);
    } on Exception catch (e) {
      print('$action 请求发生错误：${e.toString()}');
    } finally {
      print('*************************$action 请求结束*************************');
    }
  }

  static Future get(String url, {Map<String, dynamic> params}) async {
    return _delegate("Get", () async {
      return await dio.get(url, queryParameters: params);
    });
  }

  static Future post(String url, dynamic model) async {
    return _delegate("Post", () async {
      return await dio.post(url, data: model.toString());
    });
  }

  static Future put(String url, dynamic model) async {
    return _delegate("Put", () async {
      return await dio.put(url, data: model.toString());
    });
  }

  static Future delete(String url, String id) async {
    return _delegate("Delete", () async {
      return await dio.delete(url, queryParameters: {'id': id});
    });
  }
}
