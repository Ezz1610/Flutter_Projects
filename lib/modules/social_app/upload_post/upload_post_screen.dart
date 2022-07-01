import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/layout/social_app/cubit/social_cubit.dart';
import 'package:social_app/layout/social_app/cubit/social_states.dart';
import 'package:social_app/layout/social_app/social_layout.dart';
import 'package:social_app/shared/styles/brokns_icons.dart';

import '../../../shared/components/components.dart';


/*
TextButton(
onPressed: (){},
child: Row(children: [
Icon(
IconBroken.Image
),
SizedBox(width: 5,),
Text("Add Photo"),
],)),
*/
/*
TextButton(
onPressed: (){},
child: Row(children: [

Text("# Tags"),
],)),
*/

/*
version 3
class UploadPostScreen extends StatelessWidget {
  var postController=TextEditingController();
  var timeNow=DateTime.now();
  @override
  Widget  build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialStates>(
      listener:(context,state){},
      builder: (context,state){
        var postCubit=SocialCubit.get(context);

        return  Scaffold(
          appBar: defaultAppar(
            title: "Create Post",
            context: context,
            actions: [
              defultTextButton(function: (){
                if(postCubit.postImage==null)
                {
                  postCubit.createPost(text: postController.text, date: timeNow.toString(), );
                  postCubit.getDataPosts();
                  print("get update data post successfully");
                  navigetTo(context, SocialLayout());

                }
                else
                {
                  postCubit.createPostImage(text: postController.text, date: timeNow.toString());
                  postCubit.getDataPosts();
                  navigetTo(context, SocialLayout());


                }
              }, text: "Post")
            ],
          ) as PreferredSizeWidget,
          body:Padding(
            padding: const EdgeInsets.all(20.0),

            child: Column(
              children: [
                if(state is SocialCreatePostLoadingState || state is SocialCreatePostImageLoadingState)
                  LinearProgressIndicator(),
                SizedBox(height: 20,),

                Row(

                  children:  [
                    CircleAvatar(
                      radius:20 ,
                      backgroundImage: NetworkImage(postCubit.userModel!.image),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      postCubit.userModel!.name,
                      style: TextStyle(
                          height: 1.4
                      ),
                    ),

                  ],
                ),
                Expanded(
                  child: TextFormField(
                    controller: postController,
                    decoration: InputDecoration(
                      hintText: "What is on your mind",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                if(postCubit.postImage!=null)
                  Stack(
                      alignment: AlignmentDirectional.topEnd,
                      children:[
                        Container(
                          height: 140.0,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(4),
                              topRight: Radius.circular(4),

                            ),
                            image: DecorationImage(
                              image:FileImage(postCubit.postImage!),
                              fit: BoxFit.cover,
                            ),
                          ),

                        ),
                        IconButton(onPressed: (){
                          postCubit.removePostImage();
                        },
                          icon:CircleAvatar(
                            child: Icon(
                              Icons.close,
                              size: 16,
                            ),
                          ),
                        ),

                      ]),
                SizedBox(height: 30,),

                Row(children: [
                  Expanded(child:Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: (){
                            postCubit.getPostImage();
                          },
                          child: Row(children: [
                            Icon(
                                IconBroken.Image
                            ),
                            SizedBox(width: 5,),
                            Text("Add Photo"),
                          ],)),

                    ],),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: (){},
                            child: Row(children: [

                              Text("# Tags"),
                            ],)),

                      ],),
                  ),
                ],),

              ],
            ),
          ),

        );
      },
    );
  }
}
*/


class UploadPostScreen extends StatelessWidget {
  var postController=TextEditingController();
  var timeNow=DateTime.now();
  @override
  Widget  build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialStates>(
      listener:(context,state){},
      builder: (context,state){
        var postCubit=SocialCubit.get(context);

        return  Scaffold(
          appBar: defaultAppar(
            title: "Create Post",
            context: context,
            actions: [
              defultTextButton(function: (){
                if(postCubit.postImage==null)
                {
                  postCubit.createPost(text: postController.text, date: timeNow.toString(), );
                  postCubit.getDataPosts();
                  print("get update data post successfully");
                  navigetTo(context, SocialLayout());

                }
                else
                {

                    postCubit.createPostImage(
                        text: postController.text, date: timeNow.toString());
                    postCubit.getDataPosts();

                    navigetTo(context, SocialLayout());


                }
              }, text: "Post")
            ],
          ) as PreferredSizeWidget,
          body:Padding(
            padding: const EdgeInsets.all(20.0),

            child: Column(
              children: [
                if(state is SocialCreatePostLoadingState || state is SocialCreatePostImageLoadingState)
                  LinearProgressIndicator(),
                SizedBox(height: 20,),

                Row(

                  children:  [
                    CircleAvatar(
                      radius:20 ,
                      backgroundImage: NetworkImage(postCubit.userModel!.image),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      postCubit.userModel!.name,
                      style: TextStyle(
                          height: 1.4
                      ),
                    ),

                  ],
                ),
                Expanded(
                  child: TextFormField(
                    controller: postController,
                    decoration: InputDecoration(
                      hintText: "What is on your mind",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                if(postCubit.postImage!=null)
                  Stack(
                      alignment: AlignmentDirectional.topEnd,
                      children:[
                        Container(
                          height: 140.0,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(4),
                              topRight: Radius.circular(4),

                            ),
                            image: DecorationImage(
                              image:FileImage(postCubit.postImage!),
                              fit: BoxFit.cover,
                            ),
                          ),

                        ),
                        IconButton(onPressed: (){
                          postCubit.removePostImage();
                        },
                          icon:CircleAvatar(
                            child: Icon(
                              Icons.close,
                              size: 16,
                            ),
                          ),
                        ),

                      ]),
                SizedBox(height: 30,),

                Row(children: [
                  Expanded(child:Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: (){
                            postCubit.getPostImage();
                          },
                          child: Row(children: [
                            Icon(
                                IconBroken.Image
                            ),
                            SizedBox(width: 5,),
                            Text("Add Photo"),
                          ],)),

                    ],),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: (){},
                            child: Row(children: [

                              Text("# Tags"),
                            ],)),

                      ],),
                  ),
                ],),

              ],
            ),
          ),

        );
      },
    );
  }
}
