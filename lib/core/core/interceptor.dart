import 'package:dio/dio.dart';

class InterceptorManager extends Interceptor {
  onRequest(RequestOptions options) {
    var token = "";//AccountService.getCurrentUserToken();
    print("写入身份验证Token：$token");
    options.headers["Authorization"] = token;
    print('请求地址! url：${options.path} ,queryParameters: ${options.queryParameters}');
    print('发送的Body数据：${options.data}');
    return super.onRequest(options);
  }

  onResponse(Response response) {
    print('请求成功! ${response.data}');
    return super.onResponse(response);
  }

  onError(DioError err) {
    //print(err);
    return super.onError(err);
  }
}
