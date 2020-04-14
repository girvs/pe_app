class AppConfig {
  ///微信开放平台移动应用Appid
  static String weChatAppid = "wx43aba34e9e916232";
  static String appTitle = "好 考";
  static String apiBaseUrl = "http://api.haokao123.com/api/";
  static int apiRequestTimeout = 5000;
  static String ossDomain = "http://zhuofancbs.oss-cn-shenzhen.aliyuncs.com";
  static String vedioSaveDir = "/.Download";
  static String functionPage = 'http://www.haokao123.com/';
  static String courseDetailImage =
      "http://zhuofancbs.oss-cn-shenzhen.aliyuncs.com/fec666ce-7220-447a-8d35-512fd7dbf49f.jpg";

  ///当前APP的版本号
  static String currentVersionNumber = '1.13.2';
  ///视频播放最大缓冲池的数量，方便用户观看视频不用重复缓冲
  static int maxVideoBufferPoolNumber = 4;
  ///APP的更新地址
  static String appUpdateUrl = 'http://www.haokao123.com/AppBanner/Index';
  ///对应公众号的二维码地址
  static String publicNumber =
      'http://www.haokao123.com/Resource/images/gzhimg.jpg';

  //记录是否被踢下线
  static bool isKickDown = false;
  static bool isIosPlatform = false;
}
