import 'package:shared_preferences/shared_preferences.dart';
/*
* dio?.get(url,queryParameters ):this function get data from server but need to 2 parameters (url and queryParameters)
* getData(): when call this function will get data from server but this function need to take 2 parameters (url and queryParameters)
* url : this from type string
* queryParameters: this from type map because it write by key=value
* make all of [ dio,inti(),getData() ] from type static = عند استدعائه DioHelper علشان اعرف أءكسز على الدوال و المتغيرات الي داخل كلاس
* */

class CashHelper{
  //make object from type SharedPreferences

  static SharedPreferences ?sharedPreferences;
  //create the object= define the object
  static inti()async
  {
       sharedPreferences=await SharedPreferences.getInstance();
  }
 static  Future<bool?> putBoolean
       (
         {
             required String key,
             required bool value,
         }
       )async
   {
     return await  sharedPreferences?.setBool(key, value);//put data from type Boolean
   }

 static dynamic getData
      ({required String key})
  {
    return sharedPreferences?.get(key);//get data
  }

  static Future<bool?> saveData
  ({
  required String key,
  required dynamic value,
})async
  {
    if(value is String){return await sharedPreferences?.setString(key, value);}
    if(value is int){return await sharedPreferences?.setInt(key, value);}
    if(value is bool){return await sharedPreferences?.setBool(key, value);}
    else {return await sharedPreferences?.setDouble(key, value);}
  }
  static Future<bool?>removeData({
  required String key,
})async{
    return await sharedPreferences?.remove(key);
  }

}