import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:train/layout/social_app/cubit/social_cubit.dart';
import 'package:train/layout/social_app/cubit/social_states.dart';
import 'package:train/models/socialApp/comment_model.dart';
import 'package:train/models/socialApp/post_model.dart';
import 'package:train/shared/components/components.dart';
import 'package:train/shared/styles/brokns_icons.dart';
import 'package:train/shared/styles/colors.dart';

//third version
class SocialFeedScreen extends StatelessWidget {
var commentController=TextEditingController();
var timeNow=DateTime.now();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialStates>(
        listener: (context,state){},

        builder: (context,state){
          var cubit=SocialCubit.get(context);
       /*   int length=cubit.posts.length;
          int ?indexLoop;
          for(int indexValue=0;indexValue<length;indexValue++)
          {
            indexLoop=indexValue;
          }*/
          return ConditionalBuilder(
              condition: cubit.posts!.length>0 && cubit.userModel!=null,
              builder:(context)=>  SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Card(
                      margin: EdgeInsets.all( 8),
                      elevation: 5,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Stack(
                        alignment:AlignmentDirectional.bottomEnd ,
                        children:  [
                          Image(
                               fit:BoxFit.cover,
                              image: NetworkImage(cubit.userModel!.cover),
                              width: double.infinity,
                            height: 200,
                          ),
                          Text(
                            "Connect With Other People",
                            style: Theme.of(context).textTheme.subtitle1?.copyWith(
                              color: Colors.white,


                            ),
                          ),
                        ],),
                    ),
                    ListView.separated(
                        shrinkWrap:true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder:(context,index) {
                          return buildPostItem(context,cubit.posts![index],index,


                        );
                        },
                        separatorBuilder:(context,index)=>SizedBox(
                          height: 8,
                        ),
                        itemCount: cubit.posts!.length),
                    SizedBox(
                      height: 8,
                    ),


                  ],
                ),
              ),
              fallback: (context)=>Center(child: CircularProgressIndicator()))
          ;

        },
    );
  }
  int? x;
  Widget buildPostItem(context,PostModel model,index)=>Card(
    margin: EdgeInsets.symmetric(horizontal: 8),

    clipBehavior: Clip.antiAliasWithSaveLayer,
    elevation: 5,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            Row(

              children:  [
                CircleAvatar(
                  radius:20 ,
                  backgroundImage:NetworkImage(model.image),

                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                          children:[
                            Text(
                              model.name,
                              style: TextStyle(
                                  height: 1.4
                              ),
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Icon(
                              Icons.check_circle,
                              color:defaultColor,
                              size: 15,
                            ),
                          ]
                      ),
                      Text(
                          model.date,
                          style: Theme.of(context).textTheme.caption?.copyWith(
                              color: Colors.grey[350]
                          )
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 15,),

               Column(children: [
                 TextButton(onPressed: (){
                   SocialCubit.get(context).showSlideOptions();
                  // print(SocialCubit.get(context).posts.id)
                 }, child: Column(children: [
                   Icon(
                       Icons.more_horiz,
                       color:Colors.black54 ,
                   ),


                 ],)),
                 if(SocialCubit.get(context).showSlide==true)
                   Column(children: [
                     InkWell(child: Text("Delete Post",style: TextStyle(color: Colors.red),),
                       onTap: (){},
                     ),
                     InkWell(child: Text("Send To",style: TextStyle(color: defaultColor[300])),
                       onTap: (){},
                     ),

                   ],)
               ],)
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: myDivider(),
            ),
            Text(
              model.text,
              style: Theme.of(context).textTheme.subtitle1,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(bottom: 10),
              child: Container(
                width: double.infinity,
                child: Wrap(
                    children:[
                      Padding(
                        padding: const EdgeInsetsDirectional.only(end: 6),
                        child: Container(
                          height: 25,
                          child: MaterialButton(
                            onPressed: (){},
                            height: 25,
                            minWidth: 1,
                            padding: EdgeInsets.zero,
                            child: Text(
                              "#software",
                              style: Theme.of(context).textTheme.subtitle1?.copyWith(
                                color: defaultColor,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ),//#textIcon
                      Padding(
                        padding: const EdgeInsetsDirectional.only(end: 6),
                        child: Container(
                          height: 25,
                          child: MaterialButton(
                            onPressed: (){},
                            height: 25,
                            minWidth: 1,
                            padding: EdgeInsets.zero,
                            child: Text(
                              "#flutter",
                              style: Theme.of(context).textTheme.subtitle1?.copyWith(
                                color: defaultColor,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ),//#textIcon
                    ]),
              ),//container of #textIcon and image
            ),
            if(model.postImage!="")
              Container(
              width: double.infinity,
              height: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                image:DecorationImage(
                    image: NetworkImage("${model.postImage}"),
                    fit: BoxFit.cover
                ),
              ),

            ), //container og image
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Row(children: [
                Expanded(
                  child: InkWell(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 0),
                      child: Row(
                        children: [
                          Icon(
                            IconBroken.Heart,
                            color: defaultColor,
                          ),
                          Text(
                            "${SocialCubit.get(context).likes![index]}",
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ],
                      ),
                    ),
                    onTap: (){
                      SocialCubit.get(context).changeLike(SocialCubit.get(context).postsId![index]);
                    },
                  ),
                ),
                Expanded(
                  child: InkWell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          IconBroken.Chat,
                          color: Colors.amber,
                        ),
                        Text(
                          " ${SocialCubit.get(context).comments.length} Comment",
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                    onTap: (){
                      SocialCubit.get(context).showSlideComments();
                    },
                  ),
                ),
              ],),
            ),

if(SocialCubit.get(context).showComment==true)
  Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CircleAvatar(
        radius:20 ,
        backgroundImage:NetworkImage(model.image),

      ),
      SizedBox(
        width: 15,
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(.2),
                borderRadius: BorderRadius.circular(40),

              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.name,
                      style: const TextStyle(
                          height: 1.4,
                          fontWeight: FontWeight.w900,
                          fontSize: 16
                      ),
                    ),
                    Text(
                     "text comment",
                      maxLines: 3,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w100
                      ),

                    ),
                  ],
                ),
              ),
            ),
            Text(
                model.date,
                style: Theme.of(context).textTheme.caption?.copyWith(
                    color: Colors.grey[350]
                )
            ),
          ],
        ),
      ),
    ],),

            myDivider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children:  [
                  Expanded(

                      child: Row(
                        children: [
                          CircleAvatar(
                            radius:15 ,
                            backgroundImage:NetworkImage(model.image),

                          ),
                          SizedBox(width: 15,),
                          Text(
                              'write a comment ...',
                              style: Theme.of(context).textTheme.caption
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: commentController,
                              decoration: InputDecoration(
                                hintText: "Write a comment",
                                border: InputBorder.none,

                              ),
                            ),
                          ),
                        ],
                      ),
                     // onTap: (){},

                  ),
                  InkWell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 0),
                          child: TextButton(onPressed: (){
                            SocialCubit.get(context).createComment(
                                postId: SocialCubit.get(context).postsId![index],
                                date: timeNow.toString(),
                                textComment: commentController.text

                            );
                          }, child:Row(children: [
                            Icon(
                              IconBroken.Send,
                              color: defaultColor,
                            ),
                            Text(
                              "Send",
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ],)),
                        ),
                      ],),
                    onTap: (){
                      SocialCubit.get(context).changeLike(SocialCubit.get(context).postsId![index]);
                      print(SocialCubit.get(context).postsId![index]);

                    },
                  ),
                  SizedBox(width: 10,),
                  InkWell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 0),
                          child: Row(
                            children: [
                              Icon(
                                IconBroken.Heart,
                                color: defaultColor,
                              ),
                              Text(
                                "Like",
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ],
                          ),
                        ),
                      ],),
                    onTap: (){
                     SocialCubit.get(context).changeLike(SocialCubit.get(context).postsId![index]);

                    },
                  ),



                ],
              ),
            ),


          ]),
    ),


  );}
