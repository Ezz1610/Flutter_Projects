import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:train/layout/social_app/cubit/social_cubit.dart';
import 'package:train/layout/social_app/cubit/social_states.dart';
import 'package:train/modules/social_app/social_login/shop_login_screen.dart';
import 'package:train/shared/components/components.dart';
import 'package:train/shared/styles/brokns_icons.dart';

import '../../../shared/components/constants.dart';
import '../edit_profile/edit_profile.dart';

class SocialSettingScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialStates>(
      listener: (context,state){
        if (state is SocialErrorGetUserDataState)
          {
            print("11111111111111111111111111111111111111111111111111111111111111111111111111111111");
          }
        else{print("done");}
      },
      builder: (context,state) {
        var socialCubitData=SocialCubit.get(context).userModel;
        return ConditionalBuilder(
            condition: state is! SocialLoadingGetUserDataState,
            builder:(context)=> Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    height: 180,
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        Align(

                          child: Container(
                            height: 140.0,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(4),
                                topRight: Radius.circular(4),

                              ),
                              image: DecorationImage(
                                image: NetworkImage(socialCubitData!.cover),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          alignment: AlignmentDirectional.topCenter,
                        ),
                        CircleAvatar(
                          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                          radius: 42,
                          child: CircleAvatar(
                            radius: 40,
                            backgroundImage:NetworkImage(socialCubitData.image) ,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                      socialCubitData.name,
                      style:Theme.of(context).textTheme.bodyText1
                  ),
                  Text(
                      socialCubitData.bio,
                      style:Theme.of(context).textTheme.caption
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            child: Column(
                              children: [
                                Text("100",
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                Text("Posts",
                                  style: Theme.of(context).textTheme.caption,
                                ),

                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            child: Column(
                              children: [
                                Text("100",
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                Text("Photos",
                                  style: Theme.of(context).textTheme.caption,
                                ),

                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            child: Column(
                              children: [
                                Text("100",
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                Text("Followers",
                                  style: Theme.of(context).textTheme.caption,
                                ),

                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            child: Column(
                              children: [
                                Text("100",
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                Text("Following",
                                  style: Theme.of(context).textTheme.caption,
                                ),

                              ],
                            ),
                          ),
                        ),



                      ],
                    ),
                  ),
                  Row(children: [
                    Expanded(child: OutlinedButton(onPressed: (){}, child: Text("Add Photo"),)),
                    SizedBox(width: 10,),
                    OutlinedButton(onPressed: (){
                      navigetTo(context, SocialEditProfileScreen());
                    }, child: Icon(IconBroken.Edit))
                  ],),
                  //defultTextButton(function: (){signOutSocial(context);}, text: "LogOut")

                ],
              ),
            ),
            fallback: (context)=>Center(child: const CircularProgressIndicator()));
      },
    );
  }
/*
  Widget build(BuildContext context) {
    return  Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    height: 180,
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        Align(

                          child: Container(
                            height: 140.0,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage("https://img.freepik.com/free-photo/grilled-meat-skewers-chicken-shish-kebab-with-zucchini-tomatoes-red-onions_2829-10942.jpg?w=1060&t=st=1654881892~exp=1654882492~hmac=acdb9fce3a61475aaf11cc319f4cadb54cb6a8acceb13852b9385deefbc59d43"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          alignment: AlignmentDirectional.topCenter,
                        ),
                        CircleAvatar(
                          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                          radius: 42,
                          child: CircleAvatar(
                            radius: 40,
                            backgroundImage:NetworkImage("https://img.freepik.com/free-photo/intelligent-bearded-student-yellow-hat-striped-jumper-prepares-workshop-stands-with-papers-notepad_273609-34116.jpg?w=1060&t=st=1654763941~exp=1654764541~hmac=26845e0a3e9f2a899352e8e290a06275c62a894e176e3df43e05c5fd2b890ad8") ,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(

                  "fenoo",
                      style:Theme.of(context).textTheme.bodyText1
                  ),
                  Text(
                      "write bio...",
                      style:Theme.of(context).textTheme.caption
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Text("100",
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                              Text("Post",
                                style: Theme.of(context).textTheme.caption,
                              ),

                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text("100",
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                              Text("Post",
                                style: Theme.of(context).textTheme.caption,
                              ),

                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text("100",
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                              Text("Post",
                                style: Theme.of(context).textTheme.caption,
                              ),

                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text("100",
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                              Text("Post",
                                style: Theme.of(context).textTheme.caption,
                              ),

                            ],
                          ),
                        ),


                      ],
                    ),
                  ),
                  Row(children: [
                    Expanded(child: OutlinedButton(onPressed: (){}, child: Text("Add Photo"),)),
                    SizedBox(width: 10,),
                    OutlinedButton(onPressed: (){}, child: Icon(IconBroken.Edit))
                  ],),
                  defultTextButton(function: (){signOutSocial(context);}, text: "LogOut")
                ],
              ),

    );
  }
*/
}
