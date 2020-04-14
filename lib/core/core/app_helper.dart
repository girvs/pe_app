import 'dart:convert';

import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';

class AppHelper {
  ///校验手机号码正不正确
  static bool verificationPhone(value) {
    var p = value;
    RegExp exp = RegExp(
        r'^((13[0-9])|(14[0-9])|(15[0-9])|(16[0-9])|(17[0-9])|(18[0-9])|(19[0-9]))\d{8}$');
    return exp.hasMatch(p);
  }

  ///生成MD5码
  static String generateMd5(String data) {
    var content = new Utf8Encoder().convert(data);
    var digest = md5.convert(content);
    return hex.encode(digest.bytes);
  }

  ///替换所有的HTML标签
  static String regExpHtml(String text) {
    text = text
        .replaceAll(new RegExp("<[^>]+>"), "")
        .replaceAll("<p>", '')
        .replaceAll("&nbsp;", "")
        .replaceAll("</p>", '');
    return text;
  }
}
