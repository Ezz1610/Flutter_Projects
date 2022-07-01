
import 'package:social_app/models/socialApp/create_user_model.dart';


abstract class SocialRegisterStates{}
class SocialRegisterInitialState extends SocialRegisterStates{}
class SocialRegisterLoadingState extends SocialRegisterStates{}
class SocialRegisterSuccessState extends SocialRegisterStates{
   /*late SocialRegisterModel modelRegister;
  SocialRegisterSuccessState( this.modelRegister);
*/
}
class SocialRegisterErrorState extends SocialRegisterStates{
  final String error;
  SocialRegisterErrorState(this.error);
}
class SocialRegisterChangeVisibilityState extends SocialRegisterStates{}
class SocialCreateSuccessState extends SocialRegisterStates{
  final SocialUserModel model;
  SocialCreateSuccessState(this.model);
}
class SocialCreateErrorState extends SocialRegisterStates{
  final String error;
  SocialCreateErrorState(this.error);
}
