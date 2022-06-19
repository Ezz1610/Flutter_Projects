import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:train/modules/shop_app/shop_login/cubit/states.dart';
import 'package:train/modules/social_app/social_login/cubit/states.dart';
import 'package:train/shared/network/remote/dio_helper.dart';

import '../../../../models/shop App/register_modle.dart';
import '../../../../shared/network/end_points.dart';


class SocialLoginCubit extends Cubit<SocialLoginStates>
{
  SocialLoginCubit(): super(SocialLoginInitialState());
  static SocialLoginCubit get(context)=>BlocProvider.of(context);
//late SocialRegisterModel loginModel;
   void userLogin({
      required String emailAddress,
      required String password,

})
      {
       emit(SocialLoginLoadingState()) ;
     FirebaseAuth.instance.signInWithEmailAndPassword(
         email: emailAddress,
         password: password
     ).then((value){
       print("login successful");
       print(value.user?.email);
       print("vvvvvvvvvvvvvvvvvvvvvvvvvvvvvv");

       print(value.user?.uid);
       emit(SocialLoginSuccessState(value.user!.uid));
       }
     ).catchError((error){
       emit(SocialLoginErrorState(error.toString()));
       });
     }
IconData suffix=Icons.visibility_outlined;
bool isPassword=true;
void changePasswordVisibility()
{
   isPassword =!isPassword;
   suffix=isPassword?Icons.visibility_outlined:Icons.visibility_off_outlined;
   emit(SocialLoginChangeVisibilityState());
}
}