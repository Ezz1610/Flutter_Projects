
import '../../../../models/shop App/register_modle.dart';

abstract class ShopRegisterStates{}
class ShopRegisterInitialState extends ShopRegisterStates{}
class ShopRegisterLoadingState extends ShopRegisterStates{}
class ShopRegisterSuccessState extends ShopRegisterStates{
   late ShopRegisterModel modelRegister;
  ShopRegisterSuccessState( this.modelRegister);

}
class ShopRegisterErrorState extends ShopRegisterStates{
  final String error;
  ShopRegisterErrorState(this.error);
}
class ShopRegisterChangeVisibilityState extends ShopRegisterStates{}
