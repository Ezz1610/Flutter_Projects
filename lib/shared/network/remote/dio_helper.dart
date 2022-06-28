import 'package:dio/dio.dart';
/*
* dio?.get(url,queryParameters ):this function get data from server but need to 2 parameters (url and queryParameters)
* getData(): when call this function will get data from server but this function need to take 2 parameters (url and queryParameters)
* url : this from type string
* queryParameters: this from type map because it write by key=value
* make all of [ dio,inti(),getData() ] from type static = عند استدعائه DioHelper علشان اعرف أءكسز على الدوال و المتغيرات الي داخل كلاس
* */
import 'package:dio/dio.dart';

class DioHelper {
  static Dio ?dio;
  static inti(){
    dio=Dio(
      BaseOptions(
        baseUrl:"https://newsapi.org/",
        receiveDataWhenStatusError:true,

      ),
    );
  }
  static Future<Response?> getData({
    required String url,
    required Map<String,dynamic> queries
  })async
  {
    return await dio?.get(url,queryParameters:queries );
  }
}