import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/modules/social_app/social_register/cubit/states.dart';

import '../../../../models/socialApp/create_user_model.dart';

class SocialRegisterCubit extends Cubit<SocialRegisterStates>
{
  SocialRegisterCubit(): super(SocialRegisterInitialState());
  static SocialRegisterCubit get(context)=>BlocProvider.of(context);
 //late SocialRegisterModel registerModel;

  void userRegister({
     required String name,
     required String phone,
     required String emailAddress,
     required String password,

   })
      {
       emit(SocialRegisterLoadingState()) ;
        FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailAddress,
            password: password,

        ).then((value) {
          /*print("hello");
          print(value.user?.email);
          print(value.user?.uid);*/
          // createUser become full of data
          createUser
            (
              name: name, //from input name
              phone: phone, //from input phone
              email: emailAddress, //from input emailAddress
              uId:value.user!.uid, //from response of firebase
            );
        }).catchError((error){
          emit(SocialRegisterErrorState(error.toString()));
        });

      }

   void createUser({
     required String name,
     required String phone,
     required String email,
     required String uId,
})
   {
     // createUser become full of data from userRegister
     late SocialUserModel model;
     model=SocialUserModel(
       // the constructor of SocialUserModel become full of data from createUser that come from userRegister
         name: name, //from data of createUser that come from userRegister
         email: email,//from data of createUser that come from userRegister
         phone: phone,//from data of createUser that come from userRegister
         uId: uId, //from data of createUser that come from userRegister
         bio:"Write your bio......" ,
         image: "https://img.freepik.com/free-photo/intelligent-bearded-student-yellow-hat-striped-jumper-prepares-workshop-stands-with-papers-notepad_273609-34116.jpg?w=1060&t=st=1654763941~exp=1654764541~hmac=26845e0a3e9f2a899352e8e290a06275c62a894e176e3df43e05c5fd2b890ad8",
         cover: "https://img.freepik.com/free-photo/grilled-meat-skewers-chicken-shish-kebab-with-zucchini-tomatoes-red-onions_2829-10942.jpg?w=1060&t=st=1654881892~exp=1654882492~hmac=acdb9fce3a61475aaf11cc319f4cadb54cb6a8acceb13852b9385deefbc59d43",

     );
      print("doneeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
      print(model.uId);

      FirebaseFirestore.instance.collection("user").doc(uId).set(model.toMap()).then((value)
     {
       emit(SocialCreateSuccessState(model));
     }).catchError((error){
       print(error.toString());
       emit(SocialCreateErrorState(error.toString()));
     });
   }

IconData suffix=Icons.visibility_outlined;
bool isPassword=true;
void changePasswordVisibility()
{
   isPassword =!isPassword;
   suffix=isPassword?Icons.visibility_outlined:Icons.visibility_off_outlined;
   emit(SocialRegisterChangeVisibilityState());
}
}