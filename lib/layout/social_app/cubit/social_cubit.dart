
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_app/layout/social_app/cubit/social_states.dart';
import 'package:social_app/models/socialApp/comment_model.dart';
import 'package:social_app/models/socialApp/message_model.dart';
import 'package:social_app/models/socialApp/post_model.dart';
import 'package:social_app/modules/social_app/chats/social_chat_screen.dart';
import 'package:social_app/modules/social_app/feeds/social_feeds_screen.dart';
import 'package:social_app/modules/social_app/notifications/social_notification_screen.dart';
import 'package:social_app/modules/social_app/settings/social_settings_screen.dart';
import 'package:social_app/modules/social_app/upload_post/upload_post_screen.dart';
import 'package:social_app/shared/components/constants.dart';
import 'package:social_app/shared/network/local/cash_helper.dart';
import '../../../models/socialApp/create_user_model.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;



class SocialCubit extends Cubit<SocialStates> {
  SocialCubit() : super(SocialInitialStates());

  static SocialCubit get(context) => BlocProvider.of(context);
  SocialUserModel? userModel;

  void getUserData(){
    emit(SocialLoadingGetUserDataState());
    FirebaseFirestore.instance.collection("user").doc(uId).get().then((value){
      print("get data successfully");

      //print(value.data());
      userModel=SocialUserModel.fromJson(value.data()!);
      print(userModel!.toMap());

      emit(SocialSuccessGetUserDataState());
    }).catchError((error){
      print(error.toString());

      emit(SocialErrorGetUserDataState(error.toString()));
    });
  }
  var currentIndex=0;
  void changeIndex(int index)
  {
    if(index==1)
    {
      getUsers();
    }
    if(index==2)
    {
      emit(SocialUploadPostScreenState());
    }
    else
    {
      currentIndex=index;
      emit(SocialChangeNavbarIndex());
    }


  }
  List<String>title=[
    "Home",
    "Chat",
    "Post",
    "User",
    "Settings"
  ];
  List<Widget>screens=[
    SocialFeedScreen(),
    SocialChatScreen(),
    UploadPostScreen(),
    SocialNotificationScreen(),
    SocialSettingScreen(),
  ];

  File? profileImage;
  final picker = ImagePicker();

  Future<void> getProfileImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);


    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      emit(SocialGetProfileImageSuccessState());

    } else {
      print('No image selected.');
      emit(SocialGetProfileImageErrorState());

    }

  }
  File? profileCover;

  Future<void> getCoverImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);


    if (pickedFile != null) {
      profileCover = File(pickedFile.path);
      emit(SocialGetProfileCoverSuccessState());

    } else {
      print('No image selected.');
      emit(SocialGetProfileCoverErrorState());

    }

  }
  void updateUser({
    required String name,
    required String phone,
    required String bio,
    String? image,
    String? cover,
  })
  {
    emit(SocialUpdateUserLoadingState());
    late SocialUserModel model;
    model=SocialUserModel(
      name: name,
      phone: phone,
      bio:bio,
      email: userModel!.email,//from data of createUser that come from userRegister
      uId: userModel!.uId, //from data of createUser that come from userRegister
      cover:cover??userModel!.cover ,
      image:image??userModel!.image ,
    );

    FirebaseFirestore.instance.collection("user").doc(userModel!.uId).update(model.toMap()).then((value){
      getUserData();
    }).catchError((error){
      emit(SocialUpdateUserErrorState());
    });
  }


  void uploadImage({
    required String name,
    required String phone,
    required String bio,
  })
  {
    emit(SocialProfileImageLoadingState());
    firebase_storage.FirebaseStorage
        .instance.ref().child("user/${Uri.file(profileImage!.path)
        .pathSegments.last}").putFile(profileImage!)
        .then((value){
      value.ref.getDownloadURL().then((value) {
        updateUser(name: name, phone: phone, bio: bio,image:value);
        print("upload image successfully");
      }).catchError((error){
        emit(SocialProfileImageErrorState());
      });
    }).catchError((error){
      emit(SocialProfileImageErrorState());

    });
  }
  void uploadCover({
    required String name,
    required String phone,
    required String bio,
  })
  {
    emit(SocialProfileCoverLoadingState());
    firebase_storage.FirebaseStorage
        .instance.ref().child("user/${Uri.file(profileCover!.path)
        .pathSegments.last}").putFile(profileCover!)
        .then((value){
      value.ref.getDownloadURL().then((value) {
        updateUser(name: name, phone: phone, bio: bio,cover: value);
      }).catchError((error){
        emit(SocialProfileCoverErrorState());

      });
    }).catchError((error){
      emit(SocialProfileCoverErrorState());

    });
  }
  File? postImage;
  Future<void> getPostImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);


    if (pickedFile != null) {
      postImage = File(pickedFile.path);
      emit(SocialGetPostImageSuccessState());

    } else {
      print('No image selected.');
      emit(SocialGetPostImageErrorState());

    }

  }

// Start Cubit Post
  //createPost//////////////////////////////////////////////////////////////////////

  PostModel? createModelPost;
  void createPost({
    required String text,
    required String date,
    String? postImage,

  })
  {
    emit(SocialCreatePostLoadingState());
    createModelPost=PostModel
      (
      date: date,
      text: text,
      postImage: postImage??"",
      name: userModel!.name,
      uId: userModel!.uId,
      image: userModel!.image,
    );
    FirebaseFirestore.instance.collection('posts')
        .add(createModelPost!.toMap())
        .then((value) {
      print("post upload successfully");
      printFullText(createModelPost!.toMap().toString());
      emit(SocialCreatePostSuccessState());
      getDataPosts();
      updatePost(text: text, date: date, postId: value.id);
      updatePostImage(text: text, date: date, postId: value.id);
      getUpdatedDataPost();
    }).catchError((error){
      emit(SocialCreatePostErrorState());
    });
  }


  //createPostImage//////////////////////////////////////////////////////////////////////

  void createPostImage({
    required String text,
    required String date,

  })
  {
    emit(SocialCreatePostImageLoadingState());
    firebase_storage.FirebaseStorage.instance.ref().child("posts/${Uri.file(postImage!.path).pathSegments.last}").putFile(postImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value){
        createPost
          (
            text: text,
            date: date,
            postImage: value
        );
      }).catchError((error){
        emit(SocialCreatePostImageErrorState());
      });
    }).catchError((error){
      emit(SocialCreatePostImageErrorState());

    });

  }

//getDataPosts//////////////////////////////////////////////////////////////////////

  List<PostModel>?posts;
  List<String>?postsId;
  List<CommentUserModel>?comments;
  List<String>?commentId;
  List<int>?likes;
  List<PostModelUpdate>?postsUpdate;

  // List<int>?commentsLength;
  void getDataPosts(){

    emit(SocialGetDataPostsLoadingState());
    //انا هنا بجيب البوستات و بجيب الليكات الي موجوده في كل بوست
    /*FirebaseFirestore.instance.collection('posts').get().then((value){
      value.docs.forEach((element) {
        element.reference.collection("likes").get().then((value){
          likes.add(value.docs.length);
          posts.add(PostModel.fromJson(element.data()));
          postsId.add(element.id);
        }).catchError((error){});

        printFullText("${element.data()}");
      });*/
    FirebaseFirestore.instance.
    collection("posts")
        .orderBy("date")
        .snapshots().listen((event) {

      posts=[];
      postsId=[];
      likes=[];
      comments=[];
      commentId=[];
      postsUpdate=[];

      event.docs.forEach((element) {
        posts!.add(PostModel.fromJson(element.data()));
        postsUpdate!.add(PostModelUpdate.fromJson(element.data()));
        postsId!.add(element.id);

        element.reference.collection("likes").get().then((value){
          value.docs.forEach((element) {
            likes!.add(element.data().length);

          });

          emit(SocialGetCommentsSuccessState());
        }).catchError((error){emit(SocialGetCommentsErrorState());});


        element.reference.collection("comments").get().then((value){
          value.docs.forEach((element) {
            comments!.add(CommentUserModel.fromJson(element.data()));

          });

          emit(SocialGetCommentsSuccessState());
        }).catchError((error){emit(SocialGetCommentsErrorState());});

       // print(postsId![postsId!.length-1]);

      });
    });
    print("get posts successfully");
    //  print(postsId.length);
    // getPostsComment(postsId);//get post comment at the first of run
    print("comment get successfully");

    emit(SocialGetDataPostsSuccessState());

  }

  //updatePost//////////////////////////////////////////////////////////////////////
  PostModelUpdate? createModelPostUpdate;

  void updatePost({
    required String text,
    required String date,
    String? postImage,
    required String postId,

  })
  {
    PostModelUpdate? postModel;
    emit(SocialCreatePostLoadingState());
    createModelPost=PostModel
      (
      date: date,
      text: text,
      postImage: postImage??"",
      name: userModel!.name,
      uId: userModel!.uId,
      image: userModel!.image,
    );
    FirebaseFirestore.instance.collection('posts').doc().collection("comments").doc()
        .update(createModelPost!.toMap())
        .then((value) {
      print("post upload successfully");
      printFullText(createModelPost!.toMap().toString());
      emit(SocialCreatePostSuccessState());
    }).catchError((error){
      emit(SocialCreatePostErrorState());
    });
  }


  //updatePostImage//////////////////////////////////////////////////////////////////////
  void updatePostImage({
    required String text,
    required String date,
    required String postId,

  })
  {
    emit(SocialCreatePostImageLoadingState());
    firebase_storage.FirebaseStorage.instance.ref().child("posts/${Uri.file(postImage!.path).pathSegments.last}").putFile(postImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value){
        updatePost
          (
            text: text,
            date: date,
            postImage: value,
            postId: postId,
        );
      }).catchError((error){
        emit(SocialCreatePostImageErrorState());
      });
    }).catchError((error){
      emit(SocialCreatePostImageErrorState());

    });

  }

  //getUpdatedPost//////////////////////////////////////////////////////////////////////
  List<PostModel>?postsUpdated;
  List<String>?postsIdUpdated;
  List<CommentUserModel>?commentsUpdated;
  List<String>?commentIdUpdated;
  void getUpdatedDataPost(){

    emit(SocialGetDataPostsLoadingState());
    //انا هنا بجيب البوستات و بجيب الليكات الي موجوده في كل بوست
    /*FirebaseFirestore.instance.collection('posts').get().then((value){
      value.docs.forEach((element) {
        element.reference.collection("likes").get().then((value){
          likes.add(value.docs.length);
          posts.add(PostModel.fromJson(element.data()));
          postsId.add(element.id);
        }).catchError((error){});

        printFullText("${element.data()}");
      });*/
    FirebaseFirestore.instance.
    collection("posts")
        .orderBy("date")
        .snapshots().listen((event) {


      postsUpdated=[];
      likes=[];
      comments=[];
      commentId=[];

      event.docs.forEach((element) {
        posts!.add(PostModel.fromJson(element.data()));
        element.reference.collection("comments").get().then((value){
          value.docs.forEach((element) {
            comments!.add(CommentUserModel.fromJson(element.data()));
          });
          emit(SocialGetCommentsSuccessState());
        }).catchError((error){emit(SocialGetCommentsErrorState());});

       // print(postsId![postsId!.length-1]);
        print("get posts id successfully");
        print(posts![posts!.length-1]);

      });
    });
    print("get posts successfully");
    //  print(postsId.length);
    // getPostsComment(postsId);//get post comment at the first of run
    print("comment get successfully");

    emit(SocialGetDataPostsSuccessState());

  }


  void removePostImage(){
    postImage=null;
    emit(SocialRemovePostImageState());
  }
 // PostModel? postModel;

/*
  bool like = getLikeShard![postModel!.postId!]??initialLike;
*/

  void changeLike(String postId ,String primaryPostId){

 bool ?like;
  like = CashHelper.getData(key: postsId![postsId!.length-1])??initialLike;
    if(like==true)
    {
      like=!like!;
      CashHelper.saveData(key:postsId![postsId!.length-1] , value: like);
      emit(SocialLikePlusState());
      emit(SocialSetLikePostLoadingState());
      FirebaseFirestore.instance
          .collection("posts").doc(postId)
          .collection("likes").doc(userModel!.uId)
          .set({"like":initialLike}).then((value){
        print("data of like set to database successfully");
        emit(SocialSetLikePostSuccessState());
      }).catchError((error){
        emit(SocialSetLikePostErrorState());
      });

    }
    else{
      like=!like!;
      CashHelper.saveData(key:postsId![postsId!.length-1], value: like);

      emit(SocialLikeMinusState());
      emit(SocialDeleteLikePostLoadingState());
      FirebaseFirestore.instance
          .collection("posts").doc(postId)
          .collection("likes").doc(userModel!.uId)
          .delete().then((value){
        print("data of like deleted successfully");
        emit(SocialDeleteLikePostSuccessState());
      }).catchError((error){
        emit(SocialDeleteLikePostErrorState());
      });
    }

  }



 /* void getLikes({
    String ? postId,
  })
  {
    FirebaseFirestore.instance.
    collection("posts")
        .doc(postId!)
        .collection("likes")
        .orderBy("date")
        .snapshots().listen((event)
            {
                event.docs.forEach((element) {
                  likes!.add(element.data().length);

                });
                emit(SocialGetLikesSuccessState());

            });


  }*/

  void createComment({
    required String textComment,
    required String date,
    required String postId,
  })
  {
    CommentUserModel? commentUserModel;

    commentUserModel=CommentUserModel
      (
      postId: postId,
      date: date,
      textComment: textComment,
      name: userModel!.name,
      uId: userModel!.uId,
      image: userModel!.image,
    );
    emit(SocialCreateCommentsLoadingState());
    FirebaseFirestore.instance.collection("posts").doc(postId)
        .collection("comments")
        .add(commentUserModel.toMap()).then((value){
      print("comment uploaded successfully");
      // getPostsComment(postsId);//get post comment when create comment
      print("comment get successfully");

      emit(SocialCreateCommentsSuccessState());
    }).catchError((error){
      emit(SocialCreateCommentsErrorState());
    });
  }


  /* List<CommentUserModel>comments=[];
  List<String>commentId=[];
  List<int>commentsLength=[];

  void getPostsComment(index)
  {

    FirebaseFirestore.instance.collection("posts").doc(postsId![index])
        .collection("comments")
        .get().then((value) {
      value.docs.forEach((element) {
        element.reference.collection("comments").get().then((value) {
          commentsLength.add(value.docs.length);
          comments.add(CommentUserModel.fromJson(element.data()));
          print("comments get successfully");
          emit(SocialGetCommentsSuccessState());
        }).catchError((error){});
        emit(SocialGetCommentsErrorState());
      });

    }).catchError((error){

    });
  }*/
  bool showComment=false;

  void showSlideComments(){

    showComment=!showComment;
    emit(SocialChangeShowSlideCommentsState());

  }
  bool showSlide=false;

  void showSlideOptions(){

    showSlide=!showSlide;
    emit(SocialChangeShowSlideOptionsState());

  }


  List<SocialUserModel>?users;
//get all users accept me
  void getUsers(){
    users=[];
    emit(SocialGetUsersLoadingState());

    FirebaseFirestore.instance.collection('user').get().then((value){
      value.docs.forEach((element) {
        if(element.data()["uId"]!=userModel!.uId)
          users!.add(SocialUserModel.fromJson(element.data()));
      });
      print("users get successfully");
      print(users!.length);
      emit(SocialGetUsersSuccessState());
    }).catchError((error){
      emit(SocialGetUsersErrorState());

    });
  }

  void sendMessage({
    required String receiverId,
    required String text,
    required String date,

  })
  {
    MessageModel? messageModel;
    messageModel=MessageModel(
        senderId: userModel!.uId,
        text: text,
        receiverId: receiverId,
        date: date);
    //set message to me in server
    FirebaseFirestore.instance
        .collection("user").doc(userModel!.uId)
        .collection("chats").doc(receiverId)
        .collection("message").add(messageModel.toMap()).then((value){
      print("message sent to me in server successfully");
      emit(SocialSentMessageSuccessState());
    }).catchError((error){
      emit(SocialSentMessageErrorState());
    });
    //set message to user in server
    FirebaseFirestore.instance
        .collection("user").doc(receiverId)
        .collection("chats").doc(userModel!.uId)
        .collection("message").add(messageModel.toMap()).then((value){
      print("message sent to user in server successfully");
      emit(SocialSentMessageSuccessState());
    }).catchError((error){
      emit(SocialSentMessageErrorState());
    });
  }
  List<MessageModel>?messages=[];
  void getMessage({
    required String receiverId,
  })
  {
    FirebaseFirestore.instance
        .collection("user").doc(userModel!.uId)
        .collection("chats").doc(receiverId)
        .collection("message")
        .orderBy('date')
        .snapshots()
        .listen((event) {
      messages=[];

      event.docs.forEach((element) {
        messages!.add(MessageModel.fromJson(element.data()));
        emit(SocialGetMessageSuccessState());
      });
    });
  }

/*
CommentUserModel? commentUserModel;
void createComment({
 required String textComment,
  required String date,
 required String postId,
})
{
  commentUserModel=CommentUserModel
    (
    postId: postId,
    date: date,
    textComment: textComment,
    name: userModel!.name,
    uId: userModel!.uId,
    image: userModel!.image,
  );
  emit(SocialCreateCommentsLoadingState());
FirebaseFirestore.instance.collection("posts").doc(postId)
    .collection("comments").doc(userModel!.uId)
    .set(commentUserModel!.toMap()).then((value){
      print("comment uploaded successfully");
      emit(SocialCreateCommentsSuccessState());
}).catchError((error){
      emit(SocialCreateCommentsErrorState());
});
}
*/
}

