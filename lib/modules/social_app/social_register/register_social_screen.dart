import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:social_app/layout/social_app/social_layout.dart';

import '../../../shared/components/components.dart';
import '../../../shared/components/constants.dart';
import '../../../shared/network/local/cash_helper.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';


class RegisterSocialScreen extends StatelessWidget {
  var emailController=TextEditingController();
  var passwordController=TextEditingController();
  var nameController=TextEditingController();
  var phoneController=TextEditingController();

  var formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>SocialRegisterCubit(),
      child: BlocConsumer<SocialRegisterCubit,SocialRegisterStates>(
        listener: (context, state) {
             if(state is SocialCreateSuccessState)
               {
                 CashHelper.saveData(key: "uId", value: state.model.uId).then((value){


                   uId=state.model.uId;
                   navigetTo(context, SocialLayout());

                   print("yessssssssssssssssssssssssyyyyyyyyyyyyyyyyyyeeeeeeeeee");
                 });

                 print("createddddddddddddddddddddddddddddddddddd");
               }
        },
        builder: (context , state){

          return Scaffold(
            appBar: AppBar(),
            body:Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding:  const EdgeInsets.all(20),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "REGISTER",
                          style: Theme.of(context).textTheme.headline4?.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Register now to browse our hot offers",
                          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            color:Colors.grey,
                          ),

                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        defultTextFormField
                          (
                            controller:nameController ,
                            type: TextInputType.name,
                            label: "User Name",
                            prefix: Icons.person,
                            validate: (String? value){
                              if( value==null)
                              {
                                return "Name must not be empty";
                              }

                              return null;
                            }
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        defultTextFormField
                          (
                            controller:phoneController ,
                            type: TextInputType.number,
                            label: "Phone",
                            prefix: Icons.phone,
                            validate: (String? value){
                              if( value==null)
                              {
                                return "Phone must not be empty";
                              }

                              return null;
                            }
                        ),
                        const SizedBox(
                          height: 15,
                        ), const SizedBox(
                          height: 20,
                        ),
                        defultTextFormField
                          (
                            controller:emailController ,
                            type: TextInputType.emailAddress,
                            label: "Email Address",
                            prefix: Icons.email_outlined,
                            validate: (String? value){
                              if( value==null)
                              {
                                return "email must not be empty";
                              }

                              return null;
                            }
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        defultTextFormField
                          (

                          controller:passwordController ,
                          type: TextInputType.visiblePassword,
                          label: " Password",
                          prefix: Icons.lock_outlined,
                          suffix: SocialRegisterCubit.get(context).suffix,
                          isPassword:  SocialRegisterCubit.get(context).isPassword,//obscure
                          suffixPressed: ()
                          {
                            SocialRegisterCubit.get(context).changePasswordVisibility();


                          },
                          validate: (String? value)
                          {
                            if(value==null)
                            {return "password must not be empty";}
                            else if( value.length<5)
                            {return"password must not be less than 5 numbers";}
                            else
                            {return null;}
                          },

                          onFieldSubmit: (value){
                            SocialRegisterCubit.get(context ).userRegister(
                              emailAddress: emailController.text,
                              password: passwordController.text,
                              name: nameController.text,
                              phone: phoneController.text,
                            );

                          },

                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        ConditionalBuilder(
                          condition:state is! SocialRegisterLoadingState  ,
                          builder: ( context) => defultButton(
                              text: "Register",
                              function: () {
                                if (formKey.currentState!.validate())
                                  {
                                    SocialRegisterCubit.get(context).userRegister(
                                      emailAddress: emailController.text,
                                      password: passwordController.text,
                                      name: nameController.text,
                                      phone: phoneController.text,
                                    );
                                  }




                              }

                          ),
                          fallback: ( context)=>const Center(child: CircularProgressIndicator()),
                        ),

                      ],
                    ),
                  ),
                ),

              ),
            ),
          );
        },
      ),
    );
  }
}
/*
class RegisterSocialScreen extends StatelessWidget {
  var emailController=TextEditingController();
  var passwordController=TextEditingController();
  var nameController=TextEditingController();
  var phoneController=TextEditingController();
  var formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context)=>SocialRegisterCubit(),
      child: BlocConsumer<SocialRegisterCubit,SocialRegisterStates>(

        listener: (context, state) {

          if(state is SocialRegisterSuccessState)
          {
            print('fuckkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk');

            if(state.model.status==true)
            {
              print('nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn');

              CashHelper.saveData(key: "token", value: state.model.data?.token).then((value){
                navigetToAndFinish(context,SocialLayout());
                token=state.model.data?.token;
              });
              Fluttertoast.showToast(
                  msg: state.model.message!,
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 5,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16.0
              );

            }
            else
            {
              print(state.model.message);
              Fluttertoast.showToast(
                  msg: state.model.message!,
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 5,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
            }
          }
        },
        builder: (context , state){
          //var cubitx=SocialLoginCubit.get(context);

          return Scaffold(
            appBar: AppBar(),
            body:SingleChildScrollView(
              child: Padding(
                padding:  const EdgeInsets.all(20),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "REGISTER",
                        style: Theme.of(context).textTheme.headline4?.copyWith(
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Register now to browse our hot offers",
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          color:Colors.grey,
                        ),

                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      defultTextFormField
                        (
                          controller:nameController ,
                          type: TextInputType.name,
                          label: "User Name",
                          prefix: Icons.person,
                          validate: (String? value){
                            if( value==null)
                            {
                              return "Name must not be empty";
                            }

                            return null;
                          }
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      defultTextFormField
                        (
                          controller:phoneController ,
                          type: TextInputType.number,
                          label: "Phone",
                          prefix: Icons.phone,
                          validate: (String? value){
                            if( value==null)
                            {
                              return "Phone must not be empty";
                            }

                            return null;
                          }
                      ),
                      const SizedBox(
                        height: 15,
                      ),

                      defultTextFormField
                        (
                          controller:emailController ,
                          type: TextInputType.emailAddress,
                          label: "Email Address",
                          prefix: Icons.email_outlined,
                          validate: (String? value){
                            if( value==null)
                            {
                              return "email must not be empty";
                            }

                            return null;
                          }
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      defultTextFormField
                        (

                        controller:passwordController ,
                        type: TextInputType.visiblePassword,
                        label: " Password",
                        prefix: Icons.lock_outlined,
                        suffix: SocialRegisterCubit.get(context).suffix,
                        isPassword:  SocialRegisterCubit.get(context).isPassword,//obscure
                        suffixPressed: ()
                        {
                          SocialRegisterCubit.get(context).changePasswordVisibility();


                        },
                        validate: (String? value)
                        {
                          if(value==null)
                          {return "email must not be empty";}
                          else if( value.length<5)
                          {return"password must not be less than 5 numbers";}
                          else
                          {return null;}
                        },
                        onFieldSubmit: (value){
                          SocialRegisterCubit.get(context ).userRegister(
                            emailAddress: emailController.text,
                            password: passwordController.text,
                            name: nameController.text,
                            phone: phoneController.text,
                           );
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      ConditionalBuilder(
                        condition:state is! SocialRegisterLoadingState,
                        builder: (BuildContext context) => defultButton(
                            text: "register",
                            function: () {
                            if(formKey.currentState!.validate())
                              {
                                SocialRegisterCubit.get(context).userRegister(
                                  emailAddress: emailController.text,
                                  password: passwordController.text,
                                  name: nameController.text,
                                  phone: phoneController.text,
                                );
                              }
                            }
                        ),
                        fallback: (BuildContext context)=>const Center(child: CircularProgressIndicator()),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}*/
