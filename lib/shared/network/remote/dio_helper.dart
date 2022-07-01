import 'package:dio/dio.dart';
/*
* dio?.get(url,queryParameters ):this function get data from server but need to 2 parameters (url and queryParameters)
* getData(): when call this function will get data from server but this function need to take 2 parameters (url and queryParameters)
* url : this from type string
* queryParameters: this from type map because it write by key=value
* make all of [ dio,inti(),getData() ] from type static = عند استدعائه DioHelper علشان اعرف أءكسز على الدوال و المتغيرات الي داخل كلاس
* */
class DioHelper {
  //make object from type Dio
  static Dio ?dio;
  //create the object= define the object
  static inti(){
    dio=Dio(
      BaseOptions(
          baseUrl:"https://student.valuxapps.com/api/",
          receiveDataWhenStatusError:true,

      ),
    );
  }
  static Future<Response?> getData({
  required String url,
   Map<String,dynamic> ?queries,
    String ?lang="en",
    String ?token,

  })async
  {
    dio?.options.headers={
      "lang":lang,
      'Authorization': token,
      'Content-Type': 'application/json',
    };
  return await dio?.get(url,queryParameters:queries );
  }

  static Future<Response>?postData({
  required String url,
  required Map<String,dynamic> data,
  Map<String,dynamic> ?query,
    String ?lang,
    String ?token,
}){
    dio?.options.headers =
    {
      'lang':lang,
      'Authorization': token??"",
      'Content-Type': 'application/json',
    };
    return dio?.post(
      url,
      data: data,
      queryParameters: query,
    );
  }
}