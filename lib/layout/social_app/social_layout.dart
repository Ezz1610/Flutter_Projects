import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/layout/social_app/cubit/social_cubit.dart';
import 'package:social_app/layout/social_app/cubit/social_states.dart';
import 'package:social_app/modules/social_app/upload_post/upload_post_screen.dart';
import 'package:social_app/shared/components/components.dart';
import 'package:social_app/shared/styles/brokns_icons.dart';
import 'package:social_app/shared/styles/colors.dart';

class SocialLayout  extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialStates>(
      listener: (context,state){
        if(state is SocialUploadPostScreenState)
          {
            navigetTo(context, UploadPostScreen());
          }
      },
      builder: (context,state){
        var cubit =SocialCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title:Text(cubit.title[cubit.currentIndex]),
            actions: [
              IconButton(
                  onPressed: (){},
                  icon: const Icon(IconBroken.Notification,color:defaultColor,)),
              IconButton(
                  onPressed: (){},
                  icon: const Icon(IconBroken.Search,color:defaultColor,)),
            ],
          ),
          body:cubit.screens[cubit.currentIndex] ,
          bottomNavigationBar: BottomNavigationBar(currentIndex: cubit.currentIndex,
            items:navBarItems(
            icon1:IconBroken.Home ,
            labelData1:"Home" ,
            icon2:IconBroken.Chat ,
            labelData2: "Chat",
            icon3:IconBroken.Upload ,
            labelData3:"Post" ,
            icon4:IconBroken.Location ,
            labelData4:"Users" ,
            icon5:IconBroken.Setting ,
            labelData5:"Settings" ,

          ),
            onTap: (index){
              cubit.changeIndex(index);
            },
          ),
        );
    },
    );
  }
}
