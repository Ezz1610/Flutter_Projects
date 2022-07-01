import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/modules/shop_app/shop_register/cubit/states.dart';
import 'package:shop_app/shared/components/constants.dart';
import 'package:shop_app/shared/network/remote/dio_helper.dart';
import '../../../../models/shop App/register_modle.dart';
import '../../../../shared/network/end_points.dart';


class ShopRegisterCubit extends Cubit<ShopRegisterStates>
{
  ShopRegisterCubit(): super(ShopRegisterInitialState());
  static ShopRegisterCubit get(context)=>BlocProvider.of(context);
 late ShopRegisterModel registerModel;
   void userRegister({
     required String name,
     required String phone,
     required String emailAddress,
     required String password,

   })
      {
       emit(ShopRegisterLoadingState()) ;

       DioHelper.postData(
            url: REGISTER,
            lang: "en",
            data: {
              "name":name,
              "phone":phone,
              "email":emailAddress,
              "password":password,
            })?.then((value) {

         printFullText(value.data.toString());
             registerModel=ShopRegisterModel.fromJson(value.data);

             // print(value.data);
         print("whhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh");

         emit(ShopRegisterSuccessState(registerModel));// if code is 200
        }).catchError((error){
          emit(ShopRegisterErrorState(error.toString()));//if code is not 200
        });
      }

IconData suffix=Icons.visibility_outlined;
bool isPassword=true;
void changePasswordVisibility()
{
   isPassword =!isPassword;
   suffix=isPassword?Icons.visibility_outlined:Icons.visibility_off_outlined;
   emit(ShopRegisterChangeVisibilityState());
}
}