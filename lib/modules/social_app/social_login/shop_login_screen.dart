
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:social_app/layout/social_app/social_layout.dart';
import 'package:social_app/shared/components/components.dart';
import 'package:social_app/shared/network/local/cash_helper.dart';

import '../../../shared/components/constants.dart';
import '../social_register/register_social_screen.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class SocialLoginScreen extends StatelessWidget {
var emailController=TextEditingController();
var passwordController=TextEditingController();
var formKey=GlobalKey<FormState>();
//bool isPassword=true;

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context)=>SocialLoginCubit(),
      child: BlocConsumer<SocialLoginCubit,SocialLoginStates>(

        listener: (context, state) {
          if(state is SocialLoginSuccessState)
            {
              CashHelper.saveData(key: "uId", value: state.uId).then((value){
                navigetToAndFinish(context, SocialLayout());

              });
            }

        if(state is SocialLoginErrorState)
            {
              Fluttertoast.showToast(
                  msg: state.error,/**/
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 5,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
            }

        },


        builder: (context , state){

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
                        "LOGIN",
                        style: Theme.of(context).textTheme.headline4?.copyWith(
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Login To Connect With Other ",
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          color:Colors.grey,
                        ),

                      ),
                      const SizedBox(
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
                          suffix: SocialLoginCubit.get(context).suffix,
                          isPassword:  SocialLoginCubit.get(context).isPassword,//obscure
                          suffixPressed: ()
                              {
                                SocialLoginCubit.get(context).changePasswordVisibility();


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
                          SocialLoginCubit.get(context ).userLogin(
                            emailAddress: emailController.text,
                            password: passwordController.text,
                          );
                        },

                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      ConditionalBuilder(
                        condition:state is! SocialLoginLoadingState ,
                        builder: (BuildContext context) => defultButton(
                              text: "login",
                              function: () {
                              if(formKey.currentState!.validate())
                                {
                                    SocialLoginCubit.get(context).userLogin(
                                    emailAddress: emailController.text,
                                    password: passwordController.text,
                                  );
                                }
                              }
                          ),
                        fallback: (BuildContext context)=>const Center(child: CircularProgressIndicator()),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("don't have an account?"),
                          defultTextButton(
                              function: (){
                                navigetTo(context,RegisterSocialScreen());
                              },
                              text: "Register"
                          ),
                        ],
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
}
