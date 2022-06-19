import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:train/layout/social_app/cubit/social_cubit.dart';
import 'package:train/layout/social_app/cubit/social_states.dart';
import 'package:train/models/socialApp/create_user_model.dart';
import 'package:train/modules/social_app/chat_details/chat_details_screen.dart';
import 'package:train/shared/components/components.dart';

class SocialChatScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
  return BlocConsumer<SocialCubit,SocialStates>
    (
      listener: (context,state){},
      builder: (context,state){
        var cubit=SocialCubit.get(context);
        return ListView.separated(
            itemBuilder:(context,index) {
              return buildItemUsers(context,cubit.users![index]);
            },
            separatorBuilder:(context,index)=> myDivider(),
            itemCount: cubit.users!.length);

      },
  );
  }
  Widget buildItemUsers(context,SocialUserModel socialUserModel)=>InkWell(
    onTap: (){
      navigetTo(context, SocialChatDetailsScreen(
        userModelAcceptMe: socialUserModel,
      ));
    },
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(

        children:  [
          CircleAvatar(
            radius:20 ,
            backgroundImage:NetworkImage(socialUserModel.image),

          ),
          SizedBox(width: 20,),
          Text(
            socialUserModel.name,
            style: TextStyle(
                height: 1.4
            ),
          ),

        ],
      ),
    ),
  );
}
