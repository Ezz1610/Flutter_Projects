import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:social_app/shared/cubit/states.dart';


import '../network/local/cash_helper.dart';


class AppCubit extends Cubit<AppStates>
{

  AppCubit() : super(AppInitialState());
  // create function from type AppCubit and this function take context and return object from type AppCubit
  // function name is:get(context)
  // object name is:BlocProvider.of(context)
  // This function take context because of the object need context
  static AppCubit get(context)=>BlocProvider.of(context);






  bool isDark=false;
  void changeMood ({bool ?fromShard})//note:the value of fromShard send when Run main Not when call void changeMood
  {
    if(fromShard!=null)
      {
        isDark=fromShard;
        emit(AppChangeMoodStates());
      }
    else
      {
         isDark=!isDark;

         CashHelper.putBoolean(key: "dark", value: isDark).then((value) {
           emit(AppChangeMoodStates());
         });

      }
print(fromShard);
  }


}
