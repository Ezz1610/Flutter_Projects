
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/shop_app/cubit/shop_states.dart';
import 'package:shop_app/models/shop%20App/categories_model.dart';
import 'package:shop_app/models/shop%20App/change_favorites_model.dart';
import 'package:shop_app/models/shop%20App/get_favorites_model.dart';
import 'package:shop_app/models/shop%20App/home_modle.dart';
import 'package:shop_app/models/shop%20App/register_modle.dart';
import 'package:shop_app/modules/shop_app/categories/categories_screen.dart';
import 'package:shop_app/modules/shop_app/favorites/favorites_screen.dart';
import 'package:shop_app/modules/shop_app/products/productes_screen.dart';
import 'package:shop_app/modules/shop_app/settings/settings_screen.dart';
import 'package:shop_app/shared/components/constants.dart';
import 'package:shop_app/shared/network/end_points.dart';

import '../../../shared/network/remote/dio_helper.dart';

class ShopCubit extends Cubit<ShopStates>
{
  ShopCubit() : super(ShopInitialStates());
  static ShopCubit get(context)=>BlocProvider.of(context);
 int currentIndex=0;
 void changeIndex(int index)
 {
   currentIndex=index;
   emit(ShopChangeBottomNavState());
 }
 List<Widget>screens=[
   ProductsScreen(),
   CategoriesScreen(),
   FavoritesScreen(),
    SettingsScreen()

 ];

     HomeModel? homeModel;
     Map<dynamic,dynamic>favoriteMap={};
  void getHomeData(){
    emit(ShopLoadingHomeState());
    DioHelper.getData(
      url: HOME,
      token: token,
    ).then((value){
      homeModel=HomeModel.fromJson(value?.data);
      homeModel!.data!.products.forEach((element) {
        favoriteMap.addAll({element.id:element.inFavorites});
      });
      emit(ShopSuccessHomeState());
    }).catchError((error){
      emit(ShopErrorHomeState());
    });

  }

    CategoriesModel ?categoriesModel;
void getCategoriesData(){
  DioHelper.getData(
    url: GET_CATEGORIES,
    token: token,
  ).then((value){
    categoriesModel=CategoriesModel.fromJson(value!.data);

    emit(ShopSuccessCategoriesState());
  }).catchError((error){
    print(error.toString());
    emit(ShopErrorCategoriesState());
  });

}



 ChangeFavoritesModel? changeFavoritesModel;
void changeFavorites(int productId){
  favoriteMap[productId]=!favoriteMap[productId];
emit(ShopChangeFavoritesColor());
  DioHelper.postData(
      url: FAVORITES,
      data: {"product_id":productId},
     token: token,
     lang: 'en',
  )?.then((value){
    changeFavoritesModel=ChangeFavoritesModel.fromJson(value.data);
    print(changeFavoritesModel!.message.toString());
    if(changeFavoritesModel!.status==false)
      {
        favoriteMap[productId]=!favoriteMap[productId];

      }
     else{
       getFavorites();//كل ما هغير في حالة المنتج سواء بجعله في المفضله ام لا هيتم استدعاء المنتجات المفضله مره اخرى
    }
    emit(ShopChangeSuccessFavorites(changeFavoritesModel!));

  }).catchError((error){
    favoriteMap[productId]=!favoriteMap[productId];
    emit(ShopChangeErrorFavorites());

  });
}

   GetFavModel? getFavModel;

  void getFavorites(){
    emit(ShopGetLoadingStateFavorites());

    DioHelper.getData(
      url: FAVORITES,
      token: token,

    ).then((value) {
      getFavModel=GetFavModel.fromJson(value?.data);

     //printFullText(value!.data.toString());
      emit(ShopGetSuccessFavorites());
    }).catchError((error){
       print(error.toString());
       emit(ShopGetErrorFavorites());
    });
  }
  late ShopRegisterModel userModel;
  void getDataUser(){
    emit(ShopGetLoadingProfileState());
    DioHelper.getData(
      url: PROFILE,
      lang: "en",
      token: token,
    ).then((value) {
      userModel=ShopRegisterModel.fromJson(value!.data);

      //printFullText(userModel.message);
      emit(ShopGetSuccessProfileState());
    }).catchError((error){
      print(error.toString());
      emit(ShopGetErrorProfileState());
    });
  }
}
