import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:train/layout/shop_app/cubit/shop_states.dart';
import 'package:train/shared/components/components.dart';
import 'package:train/shared/components/constants.dart';

import '../../../layout/shop_app/cubit/shop_cubit.dart';
import '../shop_login/cubit/cubit.dart';

class SettingsScreen extends StatelessWidget {
  var namedController=TextEditingController();
var emailController=TextEditingController();
var phoneController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>
      (
        listener: (context,state){

        },
        builder:(context,state) {
          var model=ShopCubit.get(context).userModel.data!;
          namedController.text=model.name;
          emailController.text=model.email;
          phoneController.text=model.phone;
            return ConditionalBuilder(
                condition:state is! ShopGetLoadingProfileState,
                builder:(context)=>Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    defultTextFormField(
                        controller: namedController,
                        type: TextInputType.text,
                        label: "Name",
                        prefix: Icons.person,
                        validate: (value){
                          if(value.isEmpty)
                          {
                            return"Name must not be empty";
                          }
                          else {
                            return null;
                          }
                        }),
                    const SizedBox(
                      height: 20.0,
                    ),
                    defultTextFormField(
                        controller: emailController,
                        type: TextInputType.emailAddress,
                        label: "Email Address",
                        prefix: Icons.email_outlined,
                        validate: (value){
                          if(value.isEmpty){
                            return "Email must not be empty";
                          }
                          else{
                            return null;
                          }
                        }),
                    const SizedBox(
                      height: 20.0,
                    ),
                    defultTextFormField(
                        controller: phoneController,
                        type: TextInputType.number,
                        label: "Phone Number",
                        prefix: Icons.phone_android,
                        validate: (value){
                          if(value.isEmpty)
                          {
                            return"Phone must not be empty";
                          }
                          else{
                            return null;
                          }
                        }),
                    const SizedBox(
                      height: 20.0,
                    ),
                    defultButton(function: (){
                      signOutShop(context);
                    }, text: "Logout")

                  ],
                ),
                fallback:(context)=>const Center(child: CircularProgressIndicator()));



        },

    );
  }














}
