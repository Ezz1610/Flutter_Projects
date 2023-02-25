import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:movies_app/core/error/exception_error.dart';
import 'package:movies_app/core/network/error_message_model.dart';
import 'package:movies_app/core/utilis/constance.dart';
import 'package:movies_app/movies/data/model/movies_model.dart';

import '../../domain/entities/movies.dart';

abstract class BaseMoviesRemoteDataSource{
  Future<List<MoviesModel>> getNowPlayingMovies();
  Future<List<MoviesModel>> getPopularMovies();
  Future<List<MoviesModel>> getTopRatedMovies();
}
class MoviesRemoteDataSource extends BaseMoviesRemoteDataSource{
  @override
  Future<List<MoviesModel>> getNowPlayingMovies()async {
    final response=await Dio().get(
       AppConstance.nowPlaying,
    );
    if(response.statusCode==200){
      return List<MoviesModel>.from(response.data["results"].map((e)=>MoviesModel.fromJson(e)));
      ///TODO:try this code
      //return response.data["results"].map((e)=>MoviesModel.fromJson(e));
    }
    else{
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MoviesModel>> getPopularMovies()async {
    final response=await Dio().get(
      AppConstance.popular,
    );
    if(response.statusCode==200){
      return List<MoviesModel>.from(response.data["results"].map((e)=>MoviesModel.fromJson(e)));
      ///TODO:try this code
      //return response.data["results"].map((e)=>MoviesModel.fromJson(e));
    }
    else{
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }

  }

  @override
  Future<List<MoviesModel>> getTopRatedMovies()async {

    final response=await Dio().get(
      AppConstance.topRated,
    );
    if(response.statusCode==200){
      return List<MoviesModel>.from(response.data["results"].map((e)=>MoviesModel.fromJson(e)));
      ///TODO:try this code
      //return response.data["results"].map((e)=>MoviesModel.fromJson(e));
    }
    else{
     throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

}