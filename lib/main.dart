import 'package:flutter/material.dart';
import 'core/configuration/app_config.dart';
import 'core/configuration/app_setting.dart';
import 'core/route/routes.dart';
import 'style/theme.dart';
import 'style/util.dart';

void main() {
  //system start format开始初始化
  AppSetting.getInstance();

  runApp(
    new MaterialApp(
      themeMode: ThemeMode.dark,
      theme: Constants.lightTheme,
      darkTheme: Constants.darkTheme,
      debugShowCheckedModeBanner: false, //
      title: AppConfig.appTitle,
      //home: FLToast.showLoading(text:"正在加载中..."),
      onGenerateRoute: Routes.router.generator,
    ),
  );
  // if (Platform.isAndroid) {
  //   SystemUiOverlayStyle systemUiOverlayStyle =
  //       SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  //   SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  // }
  Util.initialize();
}
