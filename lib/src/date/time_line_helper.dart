import 'package:dart_base_helper_lib/src/date/date_helper.dart';

/// 时间线工具类
class TimeLineHelper {
  /// 时间戳->转化为时间描述
  static String convertToDateDescriptionByDateTime(String dateTime){
    if(dateTime.isEmpty) return "";
    if(dateTime.length  == 10){
      dateTime = dateTime + "000";
    }

    DateTime date = DateTime.fromMillisecondsSinceEpoch(int.parse(dateTime));

    int  compareTime =   date.millisecondsSinceEpoch;
    int nowTime = DateHelper.currentDateTime();

    int diff = (nowTime - compareTime) ~/ 1000;


    // 1分钟之内
    if (diff < 60) {
      return "刚刚";
    }

    // 小于1小时
    if (diff < 3600) {
      diff = diff ~/ 60;
      return "$diff分钟前";
    }
    // 小于1天
    if (diff < 3600 * 24) {
      diff = diff ~/ 3600;
      return "$diff小时前";
    }

    // 小于10天
    if (diff < 3600 * 24 * 10) {
      diff = diff ~/ (3600 * 24);
      return "$diff天前";
    }

    // 小于一个月
    if (diff < 3600 * 24 * 30) {
      int month = date.month;
      int day = date.day;
      String monthStr = month < 10 ? "0$month": "$month";
      String dayStr = day < 10 ? "0$day": "$day";
      return "$monthStr-$dayStr";
    }
    // 大于1月
    String str =  DateHelper.formatterDate(date, "yyyy-MM-dd");

    return str;
  }
}