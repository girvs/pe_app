/*
 * fluro
 * Created by Yakka
 * https://theyakka.com
 * 
 * Copyright (c) 2018 Yakka, LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:pe_app/view/account/login.dart';
import 'package:pe_app/view/chatlog/chat_log_index.dart';
import 'package:pe_app/view/chatlog/chat_window.dart';
import 'package:pe_app/view/hall/hall_anchor_details.dart';
import 'package:pe_app/view/hall/hall_index.dart';
import 'package:pe_app/view/home_main.dart';
import 'package:pe_app/view/mine/balance.dart';
import 'package:pe_app/view/mine/cash_withdrawal.dart';
import 'package:pe_app/view/mine/detail_list.dart';
import 'package:pe_app/view/mine/mine_index.dart';
import 'package:pe_app/view/mine/recharge.dart';
import 'package:pe_app/view/welcome.dart';

// var loginHandler = new Handler(
//     handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//   return new LoginPage();
// });
var welcomePageHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return new WelComePage();
});

var loginPageHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return new LoginPage();
});

var homeMainPageHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return new HomeMainPage();
});

var chatlogIndexPageHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return ChatLogIndexPage();
});

var chatWindowPageHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return ChatWindowPage();
});

var hallindexPageHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return HallIndexPage();
});

var hallHallAnchorDetailsPageHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return HallAnchorDetailsPage();
});

var mineindexPageHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return MineIndexPage();
});

var mineIndexBalancePageHandler = new Handler(
  handlerFunc: (BuildContext context,Map<String,List<String>> params){
    return BalancePage();
  }
);

var mineIndexRechargePageHandler = new Handler(
  handlerFunc: (BuildContext context,Map<String,List<String>> params){
    return RechargePage();
  }
);

var mineIndexCashWithdrawalPageHandler = new Handler(
  handlerFunc: (BuildContext context,Map<String,List<String>> params){
    return CashWithdrawalPage();
  }
);

var mineIndexDetailListPageHandler = new Handler(
  handlerFunc: (BuildContext context,Map<String,List<String>> params){
    return DetailListPage();
  }
);
// var informationDetailHandler = new Handler(
//     handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//   var id = params['id']?.first;
//   return new InformationDetailPage(id);
// });
