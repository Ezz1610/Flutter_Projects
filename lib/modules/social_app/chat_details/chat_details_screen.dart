import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/layout/social_app/cubit/social_cubit.dart';
import 'package:social_app/layout/social_app/cubit/social_states.dart';
import 'package:social_app/models/socialApp/create_user_model.dart';
import 'package:social_app/models/socialApp/message_model.dart';
import 'package:social_app/shared/styles/brokns_icons.dart';
import 'package:social_app/shared/styles/colors.dart';

class SocialChatDetailsScreen extends StatelessWidget {
  var messageController=TextEditingController();
  var timeNow=DateTime.now();

  SocialUserModel?userModelAcceptMe ;
 SocialChatDetailsScreen({this.userModelAcceptMe});
  @override
  Widget build(BuildContext context) {
    var cubit=SocialCubit.get(context);
    cubit.getMessage(receiverId: userModelAcceptMe!.uId);
    return BlocConsumer<SocialCubit,SocialStates>(
        builder: (context,state){
          return Scaffold(
            appBar: AppBar(
              title:Row(

                children:  [
                  CircleAvatar(
                    radius:20 ,
                    backgroundImage:NetworkImage(userModelAcceptMe!.image),

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
                                userModelAcceptMe!.name,
                                style: TextStyle(
                                    height: 1.4
                                ),
                              ),

                            ]
                        ),

                      ],
                    ),
                  ),

                ],
              ),

            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(children: [
                Expanded(
                  child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                      itemBuilder: (context,index){
                        var message=cubit.messages![index];
                        if(message.senderId==cubit.userModel!.uId)
                          return buildMyMessage(message);

                        return buildUserMessage(message);

                      },
                      separatorBuilder:(context,index)=>SizedBox(height: 15,),
                      itemCount:cubit.messages!.length
                  ),
                ),
               // Spacer(),
                Container(
                  clipBehavior:Clip.antiAliasWithSaveLayer ,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.grey,


                    ),
                    borderRadius:BorderRadius.circular(15),
                  ),
                  child: Row(children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          controller: messageController,
                          decoration: InputDecoration(
                              hintText: "Type Your Message....",
                              border: InputBorder.none
                          ),
                        ),
                      ),
                    ),
                    Container
                      (
                        height: 53.5,
                        decoration: BoxDecoration(
                            color: defaultColor
                        ),
                        child: MaterialButton
                          (
                          onPressed: (){
                            cubit.sendMessage(
                                receiverId: userModelAcceptMe!.uId,
                                text: messageController.text,
                                date:timeNow.toString());
                          },
                          minWidth: 1,
                          child: Icon
                            (
                            IconBroken.Send,
                            size: 16,
                            color: Colors.white,

                          ),
                        )
                    ),
                  ],),
                )

              ],),
            ),
          );
        },
        listener: (context,state){}
    );

  }
  Widget buildMyMessage(MessageModel messageModel)=>Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Container(
        decoration: BoxDecoration(
          color: defaultColor[300],
          borderRadius: BorderRadius.only(
            topLeft:Radius.circular(10),
            topRight:Radius.circular(10),
            bottomLeft:Radius.circular(10),


          ),



        ),
        padding:EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 5,
        ),
        child: Text(
          messageModel.text,
          style: TextStyle(
              color: Colors.white
          ),
        ),));

  Widget buildUserMessage(MessageModel messageModel)=>Align(
      alignment: AlignmentDirectional.centerStart,
      child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.only(
              topLeft:Radius.circular(10),
              topRight:Radius.circular(10),
              bottomRight:Radius.circular(10),


            ),



          ),
          padding:EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 5,
          ),
          child: Text(messageModel.text)));




}
