import 'package:shop_app/models/shop%20App/change_favorites_model.dart';

abstract class ShopStates{}
class ShopInitialStates extends ShopStates{}
class ShopChangeBottomNavState extends ShopStates{}
class ShopLoadingHomeState extends ShopStates{}
class ShopSuccessHomeState extends ShopStates{}
class ShopErrorHomeState extends ShopStates{}
class ShopSuccessCategoriesState extends ShopStates{}
class ShopErrorCategoriesState extends ShopStates{}
class ShopChangeFavoritesColor extends ShopStates{}
class ShopChangeSuccessFavorites extends ShopStates{
 late final ChangeFavoritesModel model;
 ShopChangeSuccessFavorites(this.model);

}
class ShopChangeErrorFavorites extends ShopStates{}
class ShopGetSuccessFavorites extends ShopStates{}
class ShopGetErrorFavorites extends ShopStates{}
class ShopGetLoadingStateFavorites extends ShopStates{}
class ShopGetSuccessProfileState extends ShopStates{}
class ShopGetErrorProfileState extends ShopStates{}
class ShopGetLoadingProfileState extends ShopStates{}