import 'package:fluro/fluro.dart';
import 'package:pe_app/core/core/netutils.dart';
import 'package:pe_app/core/route/application.dart';
import 'package:pe_app/core/route/routes.dart';

class AppSetting {
  static AppSetting _instance;
  static AppSetting getInstance() {
    if (_instance == null) {
      _instance = new AppSetting();
    }
    return _instance;
  }

  AppSetting() {
    //WeChatService.initialization();
    // AliPayService.initialization();
    _initUser();
    _initRouter();
    NetUtils.Init();
  }

  ///初始化路由
  _initRouter() {
    final router = new Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  ///初始化用户
  _initUser() async {
    // var sp = await SpUtil.getInstance();
    // var token = sp.getString(SharedPreferencesKeys.token);
    // AccountService.writeCurrentUserToken(token);
  }
}
