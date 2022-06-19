import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:train/layout/news_app/cubit/news_states.dart';

import '../../../modules/news_app/business/business_screen.dart';
import '../../../modules/news_app/science/science_screen.dart';
import '../../../modules/news_app/sports/sports_screen.dart';
import '../../../modules/shop_app/settings/settings_screen.dart';
import '../../../shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates>{
  NewsCubit() : super(NewsInitialStates());
  static NewsCubit get(context)=>BlocProvider.of(context);
  int currentIndex=0;
  void changeIndex(int index){
    currentIndex=index;
    /*if(currentIndex==1){
       getSports();
    }
     if(currentIndex==2)
      {
         getScience();
      }*/
    emit(AppChangeBottomSheetState());
  }
  List<Widget>Screens=[
    BusinessScreen(),// index = currentIndex
    SportsScreen(),// index = currentIndex
    ScienceScreen(),// index = currentIndex
  ];

  List<dynamic>business=[];
  void getBusiness(){
    emit(NewsGetBusinessLoadingStates());

        DioHelper.getData(
          url: "v2/top-headlines",
          queries: {
            "country":"eg",
            "category":"business",
            "apiKey":"65f7f556ec76449fa7dc7c0069f040ca",
          },
        ).then((value) {
          business=value?.data['articles'];
          print(business[0]["title"]);
          emit(NewsGetBusinessSuccessStates());
        }).catchError((error){
          emit(NewsGetBusinessErrorStates(error.toString()));
        });

   //else {emit(NewsGetBusinessSuccessStates());}

  }

  List<dynamic>sports=[];
  void getSports(){

       emit(NewsGetSportsLoadingStates());
       DioHelper.getData(
         url: "v2/top-headlines",
         queries: {
           "country":"eg",
           "category":"sports",
           "apiKey":"65f7f556ec76449fa7dc7c0069f040ca",
         },
       ).then((value) {
         sports=value?.data['articles'];
         print(sports[0]["title"]);
         emit(NewsGetSportsSuccessStates());
       }).catchError((error){
         print(error.toString());
         emit(NewsGetSportsErrorStates(error.toString()));
       });


  /* else
     {
       emit(NewsGetSportsSuccessStates());
     }*/
  }

  List<dynamic>science=[];
  void getScience(){

      emit(NewsGetScienceLoadingStates());
      DioHelper.getData(
        url: "v2/top-headlines",
        queries: {
          "country":"eg",
          "category":"science",
          "apiKey":"65f7f556ec76449fa7dc7c0069f040ca",
        },
      ).then((value) {
        science=value?.data['articles'];
        print(science[0]["title"]);
        emit(NewsGetScienceSuccessStates());
      }).catchError((error){
        print(error.toString());
        emit(NewsGetScienceErrorStates(error.toString()));
      });

   // else{emit(NewsGetScienceSuccessStates());}

  }

  List<dynamic>search=[];
  void getSearch(String value){
    search=[];
    DioHelper.getData(
      url: "v2/everything",
      queries: {
         "q":value,
        "apiKey":"65f7f556ec76449fa7dc7c0069f040ca",
      },
    ).then((value) {
      search=value?.data['articles'];
      print(search[0]["title"]);
      emit(NewsGetSearchSuccessStates());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetSearchErrorStates(error.toString()));

    });

  }
}