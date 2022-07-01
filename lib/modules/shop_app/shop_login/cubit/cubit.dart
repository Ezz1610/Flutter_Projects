import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/modules/shop_app/shop_login/cubit/states.dart';
import 'package:shop_app/shared/network/remote/dio_helper.dart';

import '../../../../models/shop App/register_modle.dart';
import '../../../../shared/network/end_points.dart';


class ShopLoginCubit extends Cubit<ShopLoginStates>
{
  ShopLoginCubit(): super(ShopLoginInitialState());
  static ShopLoginCubit get(context)=>BlocProvider.of(context);
late ShopRegisterModel loginModel;
   void userLogin({
      required String emailAddress,
      required String password,

})
      {
       emit(ShopLoginLoadingState()) ;
        DioHelper.postData(
            url: LOGIN,
            lang: "en",
            data: {
              "email":emailAddress,
              "password":password,
            })?.then((value) {
          loginModel=ShopRegisterModel.fromJson(value.data);
          emit(ShopLoginSuccessState(loginModel));// if code is 200

        }).catchError((error){
          emit(ShopLoginErrorState(error.toString()));//if code is not 200
        });
      }

IconData suffix=Icons.visibility_outlined;
bool isPassword=true;
void changePasswordVisibility()
{
   isPassword =!isPassword;
   suffix=isPassword?Icons.visibility_outlined:Icons.visibility_off_outlined;
   emit(ShopLoginChangeVisibilityState());
}
}