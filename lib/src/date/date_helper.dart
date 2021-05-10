import 'package:dart_base_helper_lib/src/constants/date_constants.dart';

/// 日期工具类
class DateHelper {

  ///  获取当前日期
   static String currentDateStr([String format = "yyyy-MM-dd HH:mm:ss"]){
       return formatterDate(DateTime.now(), format);
   }


   /// 是否是闰年
   static bool isLeapYear(int year){
        bool result = year % 4 == 0 && year % 100 != 0 || year % 400 == 0;
        return result;
   }

   /// 获取当前时间的时间戳
   static int currentDateTime(){
      return DateTime.now().millisecondsSinceEpoch;
   }

   /// 时间戳转时间字符串
   static String convertToDateStrByDateTime(String dateTime){
         if(dateTime.isEmpty) return "";
        if(dateTime.length  == 10){
          dateTime = dateTime + "000";
        }
        DateTime date = DateTime.fromMillisecondsSinceEpoch(int.parse(dateTime));
        String str =  formatterDate(date);
       return str;
   }



   ///   格式化日期
   ///    参数：
   ///     dateTime  日期
   ///     format  日期格式
   static  String formatterDate(DateTime dateTime, [String formatter = "yyyy-MM-dd HH:mm:ss"]){
        if(dateTime == null) return "";
        formatter = formatter ??  DateConstants.yyyy_MM_dd_HH_mm_ss;
        String resultFormatter = formatter;
        String year;

         if (formatter.contains("yyyy")){
             year = dateTime.year.toString();
             // 替换年的处理
             resultFormatter = resultFormatter.replaceAll("yyyy", year);
         }
        resultFormatter = _formatterDateComponents(dateTime.month, resultFormatter, "MM");
        resultFormatter = _formatterDateComponents(dateTime.day, resultFormatter, "dd");
        resultFormatter = _formatterDateComponents(dateTime.hour, resultFormatter, "HH");
        resultFormatter = _formatterDateComponents(dateTime.minute, resultFormatter, "mm");
        resultFormatter = _formatterDateComponents(dateTime.second, resultFormatter, "ss");

       return resultFormatter;
   }

   ///  格式化日期元素， 内部方法
   static String _formatterDateComponents(int value, String format, String cmp){
     String valueStr = value < 10 ? "0$value" : value.toString();
     if(format.contains(cmp)){
         format = format.replaceAll(cmp, valueStr);
     }
     return format;
   }

}
