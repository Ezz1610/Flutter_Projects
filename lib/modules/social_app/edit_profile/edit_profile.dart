import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/layout/social_app/cubit/social_cubit.dart';
import 'package:social_app/layout/social_app/cubit/social_states.dart';
import 'package:social_app/shared/components/components.dart';
import 'package:social_app/shared/styles/brokns_icons.dart';

class SocialEditProfileScreen extends StatelessWidget {
var formKey=GlobalKey<FormState>();
var nameController=TextEditingController();
var bioController=TextEditingController();
var phoneController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit=SocialCubit.get(context);
        var socialCubitData=SocialCubit.get(context).userModel;
        var profileImageCubit=SocialCubit.get(context).profileImage;
        var profileCoverCubit=SocialCubit.get(context).profileCover;
        nameController.text=socialCubitData!.name;
        bioController.text=socialCubitData.bio;
        phoneController.text=socialCubitData.phone;
          return Scaffold(
          appBar: AppBar(
            title: Text(
                "Edite Profile",
            ),
            actions: [
              defultTextButton(function: (){
                cubit.updateUser(name: nameController.text, phone: phoneController.text, bio: bioController.text);
              }, text: "Update"),
              SizedBox(width: 10,)
            ],

          ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: 180,
                        child: Stack(
                          alignment: AlignmentDirectional.bottomCenter,
                          children: [
                            Align(
                              child: Stack(
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
                                      image:profileCoverCubit==null?NetworkImage(socialCubitData.cover):FileImage(profileCoverCubit )as ImageProvider,
                                      fit: BoxFit.cover,
                                    ),
                                  ),

                                ),
                                  IconButton(onPressed: (){
                                    cubit.getCoverImage();

                                  },
                                      icon:CircleAvatar(
                                        child: Icon(
                                          IconBroken.Camera,
                                          size: 16,
                                        ),
                                      ),
                                  ),

                                ]),
                              alignment: AlignmentDirectional.topCenter,
                            ),
                            Stack(
                              alignment: AlignmentDirectional.bottomEnd,
                              children: [
                                CircleAvatar(
                                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                                  radius: 64,
                                  child: CircleAvatar(
                                    radius: 62,
                                    backgroundImage:profileImageCubit==null?NetworkImage(socialCubitData.image):FileImage(profileImageCubit)as ImageProvider,
                                  ),
                                ),
                                IconButton(onPressed: (){
                                  cubit.getProfileImage();
                                },
                                  icon:CircleAvatar(
                                    child: Icon(
                                      IconBroken.Camera,
                                      size: 16,
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30,),
                      Row(children: [
                        if(profileImageCubit!=null)
                        Expanded(child: defultTextButton(function: (){
                          cubit.uploadImage(name: nameController.text, phone: phoneController.text, bio: bioController.text);
                        }, text: "Upload Profile")),
                        if(profileCoverCubit!=null)
                          Expanded(child: defultTextButton(function: (){
                          cubit.uploadCover(name: nameController.text, phone: phoneController.text, bio: bioController.text);
                          }, text: "Upload Cover")),


                      ],),
                      SizedBox(height: 30,),

                      defultTextFormField(controller: nameController,
                         type: TextInputType.text,
                         label: "name",
                         prefix: IconBroken.Profile,
                         validate: (value){
                          if(value ==null)
                            {
                              return "name must not be empty";
                            }
                          else{
                            return null;
                          }
                         }),
                      SizedBox(height: 30,),

                      defultTextFormField(controller: bioController,
                          type: TextInputType.text,
                          label: "bio",
                          prefix: IconBroken.Info_Circle,
                          validate: (value){
                            if(value ==null)
                              {
                                return "bio must not be empty";
                              }
                            else
                              {
                                return null;
                              }
                          }),
                      SizedBox(height: 30,),

                      defultTextFormField(controller: phoneController,
                          type: TextInputType.phone,
                          label: "Phone",
                          prefix: IconBroken.Call,
                          validate: (value){
                            if(value ==null)
                            {
                              return "bio must not be empty";
                            }
                            else
                            {
                              return null;
                            }
                          }),

                    ],
                  ),
                ),
              ),
            ),
          );

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
