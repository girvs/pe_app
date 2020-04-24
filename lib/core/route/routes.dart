import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './route_handlers.dart';

class Routes {
  static Router router;
  static String welcomePage = '/';
  static String loginPage = '/login';

  static String homeMainPage = '/homeMain';

  static String chatlogindex = '/chatlog/index';
  static String chatWindowPage = '/chatlog/chatwindow';

  static String hallindex = '/hall/index';
  static String hallAnchorDetailsPage = '/hall/hallAnchorDetailsPage';

  static String mineindex = '/mine/index';
  static String mineIndexBalance = '/mine/balance';
  static String mineIndexRecharge = '/mine/balance/recharge';
  static String mineIndexCashWithdrawal = '/mine/balance/cashWithdrawal';
  static String mineIndexDetailList = '/mine/balance/detaillist';
  static String mineIndexVideoSetting = '/mine/VideoSetting';

//  static String courseDetail = "/course/detail/:id/:saletype/:coursename";

  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
    });

    router.define(welcomePage, handler: welcomePageHandler);
    router.define(loginPage, handler: loginPageHandler);
    router.define(homeMainPage, handler: homeMainPageHandler);

    router.define(chatlogindex, handler: chatlogIndexPageHandler);
    router.define(chatWindowPage, handler: chatWindowPageHandler);

    router.define(hallindex, handler: hallindexPageHandler);
    router.define(hallAnchorDetailsPage,
        handler: hallHallAnchorDetailsPageHandler);

    router.define(mineindex, handler: mineindexPageHandler);
    router.define(mineIndexBalance, handler: mineIndexBalancePageHandler);
    router.define(mineIndexRecharge, handler: mineIndexRechargePageHandler);
    router.define(mineIndexCashWithdrawal, handler: mineIndexCashWithdrawalPageHandler);
    router.define(mineIndexDetailList, handler: mineIndexDetailListPageHandler);
    router.define(mineIndexVideoSetting, handler: mineIndexVideoSettingPageHandler);
    Routes.router = router;
  }
}
