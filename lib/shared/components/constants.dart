/*

// POST
// UPDATE
// DELETE
// GET

// base url : https://newsapi.org/
// method (url) : v2/top-headlines?
// queries : country=eg&category=business&apiKey=65f7f556ec76449fa7dc7c0069f040ca
// https://newsapi.org/v2/everything?q=tesla&apiKey=65f7f556ec76449fa7dc7c0069f040ca
import 'package:shop_app/shared/network/local/cash_helper.dart';

import '../../modules/shop_app/shop_login/shop_login_screen.dart';
import '../../modules/social_app/social_login/shop_login_screen.dart';
import 'components.dart';

String ?token = '';
String ?uId="";

void printFullText(String text)
{
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}
void signOutShop(context){
  //بما ان التوكن هيتمسح فاذا قيمة التوكين الي في دالة المان هتساوي نال و دا هيعمل ارور فلزما ابعت توكن و انا بعمل تسجسل دخول
CashHelper.sharedPreferences?.remove(token!).then((value) {
  if(value ==true)
    {
      navigetToAndFinish(context,ShopLoginScreen());
    }
});
}
void signOutSocial(context){
  //بما ان التوكن هيتمسح فاذا قيمة التوكين الي في دالة المان هتساوي نال و دا هيعمل ارور فلزما ابعت توكن و انا بعمل تسجسل دخول
  CashHelper.sharedPreferences?.remove(uId!).then((value) {
    if(value ==true)
    {
      navigetToAndFinish(context,SocialLoginScreen());
    }
  });
}*/

// POST
// UPDATE
// DELETE
// GET

// base url : https://newsapi.org/
// method (url) : v2/top-headlines?
// queries : country=eg&category=business&apiKey=65f7f556ec76449fa7dc7c0069f040ca
// https://newsapi.org/v2/everything?q=tesla&apiKey=65f7f556ec76449fa7dc7c0069f040ca


import 'package:shop_app/shared/network/local/cash_helper.dart';

import '../../modules/shop_app/shop_login/shop_login_screen.dart';
import 'components.dart';

String ?token = '';
String ?uId="";
bool initialLike=true;
bool ?valueLike;

/*
void getLikeShardFunction(context){
  var socialCubitPostsId=SocialCubit.get(context).postsId;
  getLikeShard= CashHelper.getData(key:socialCubitPostsId![socialCubitPostsId!.length-1]);
}
*/

void printFullText(String text)
{
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}
void signOutShop(context){
  //بما ان التوكن هيتمسح فاذا قيمة التوكين الي في دالة المان هتساوي نال و دا هيعمل ارور فلزما ابعت توكن و انا بعمل تسجسل دخول
  CashHelper.sharedPreferences?.remove(token!).then((value) {
    if(value ==true)
    {
      navigetToAndFinish(context,ShopLoginScreen());
    }
  });
}
void signOutSocial(context){
  //بما ان التوكن هيتمسح فاذا قيمة التوكين الي في دالة المان هتساوي نال و دا هيعمل ارور فلزما ابعت توكن و انا بعمل تسجسل دخول
  CashHelper.sharedPreferences?.remove(uId!).then((value) {
    if(value ==true)
    {
      navigetToAndFinish(context,ShopLoginScreen());
    }
  });
}