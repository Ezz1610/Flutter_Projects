import 'package:train/models/shop%20App/change_favorites_model.dart';

abstract class SocialStates{}
class SocialInitialStates extends SocialStates{}
class SocialLoadingGetUserDataState extends SocialStates{}
class SocialSuccessGetUserDataState extends SocialStates{}
class SocialErrorGetUserDataState extends SocialStates{
  final String error;
  SocialErrorGetUserDataState(this.error);
}
class SocialChangeNavbarIndex extends SocialStates{}
class SocialUploadPostScreenState extends SocialStates{}
class SocialGetProfileImageSuccessState extends SocialStates{}
class SocialGetProfileImageErrorState extends SocialStates{}
class SocialGetProfileCoverSuccessState extends SocialStates{}
class SocialGetProfileCoverErrorState extends SocialStates{}
class SocialProfileImageLoadingState extends SocialStates{}
class SocialProfileCoverLoadingState extends SocialStates{}
class SocialUpdateUserLoadingState extends SocialStates{}
class SocialProfileImageErrorState extends SocialStates{}
class SocialProfileCoverErrorState extends SocialStates{}
class SocialUpdateUserErrorState extends SocialStates{}
//get post image
class SocialGetPostImageSuccessState extends SocialStates{}
class SocialGetPostImageErrorState extends SocialStates{}

//create post
class SocialCreatePostLoadingState extends SocialStates{}
class SocialCreatePostSuccessState extends SocialStates{}
class SocialCreatePostErrorState extends SocialStates{}

//create post with image
class SocialCreatePostImageLoadingState extends SocialStates{}
class SocialCreatePostImageErrorState extends SocialStates{}
//remove post image
class SocialRemovePostImageState extends SocialStates{}
//get data of posts
class SocialGetDataPostsLoadingState extends SocialStates{}
class SocialGetDataPostsSuccessState extends SocialStates{}
class SocialGetDataPostsErrorState extends SocialStates{}
//change like
class SocialLikePlusState extends SocialStates{}
class SocialLikeMinusState extends SocialStates{}
class SocialSetLikePostLoadingState extends SocialStates{}
class SocialSetLikePostSuccessState extends SocialStates{}
class SocialSetLikePostErrorState extends SocialStates{}

class SocialDeleteLikePostLoadingState extends SocialStates{}
class SocialDeleteLikePostSuccessState extends SocialStates{}
class SocialDeleteLikePostErrorState extends SocialStates{}
//create comments
class SocialCreateCommentsLoadingState extends SocialStates{}
class SocialCreateCommentsSuccessState extends SocialStates{}
class SocialCreateCommentsErrorState extends SocialStates{}
//get Comments
class SocialGetCommentsLoadingState extends SocialStates{}
class SocialGetCommentsSuccessState extends SocialStates{}
class SocialGetCommentsErrorState extends SocialStates{}
//change show
class SocialChangeShowSlideCommentsState extends SocialStates{}
//change show
class SocialChangeShowSlideOptionsState extends SocialStates{}
//get users
class SocialGetUsersLoadingState extends SocialStates{}
class SocialGetUsersSuccessState extends SocialStates{}
class SocialGetUsersErrorState extends SocialStates{}
//sent message
class SocialSentMessageSuccessState extends SocialStates{}
class SocialSentMessageErrorState extends SocialStates{}
//get message
class SocialGetMessageSuccessState extends SocialStates{}

/*
class SocialUploadPostState extends SocialStates{}
*/
