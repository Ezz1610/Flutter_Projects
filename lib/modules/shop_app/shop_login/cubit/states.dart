import 'package:shop_app/models/shop%20App/register_modle.dart';

abstract class ShopLoginStates{}
class ShopLoginInitialState extends ShopLoginStates{}
class ShopLoginLoadingState extends ShopLoginStates{}
class ShopLoginSuccessState extends ShopLoginStates{
   late ShopRegisterModel modelLogin;
  ShopLoginSuccessState( this.modelLogin);

}
class ShopLoginErrorState extends ShopLoginStates{
  final String error;
  ShopLoginErrorState(this.error);
}
class ShopLoginChangeVisibilityState extends ShopLoginStates{}
