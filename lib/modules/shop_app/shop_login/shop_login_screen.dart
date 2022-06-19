
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:train/layout/shop_app/shop_layout.dart';
import 'package:train/shared/components/components.dart';
import 'package:train/shared/network/local/cash_helper.dart';

import '../../../shared/components/constants.dart';
import '../on_boarding/on_boarding_screen.dart';
import '../shop_register/register_shop_screen.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class ShopLoginScreen extends StatelessWidget {
var emailController=TextEditingController();
var passwordController=TextEditingController();
var formKey=GlobalKey<FormState>();
//bool isPassword=true;

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context)=>ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit,ShopLoginStates>(

        listener: (context, state) {

          if(state is ShopLoginSuccessState)
            {
              if(state.modelLogin.status==true)
                {
                  print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1");

                  CashHelper.saveData(key: "token", value: state.modelLogin.data!.token).then((value){
                    navigetToAndFinish(context,ShopLayout());
                    token=state.modelLogin.data!.token;//
                    print("??????????????????????????????????????");

                  });
                  Fluttertoast.showToast(
                      msg: state.modelLogin.message!,
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
                  print(state.modelLogin.message);
                  Fluttertoast.showToast(
                      msg: state.modelLogin.message!,
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 5,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );
                }
            }
          else if(state is ShopLoginLoadingState){
            print("احااااااااااااااااااااااااااااااااااااااااااااااااااااااااااا");}
        },
        builder: (context , state){
          //var cubitx=ShopLoginCubit.get(context);

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
                        "Login now to browse our hot offers",
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
                          suffix: ShopLoginCubit.get(context).suffix,
                          isPassword:  ShopLoginCubit.get(context).isPassword,//obscure
                          suffixPressed: ()
                              {
                                ShopLoginCubit.get(context).changePasswordVisibility();


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
                          ShopLoginCubit.get(context ).userLogin(
                            emailAddress: emailController.text,
                            password: passwordController.text,
                          );
                        },

                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      ConditionalBuilder(
                        condition:state is! ShopLoginLoadingState ,
                        builder: (BuildContext context) => defultButton(
                              text: "login",
                              function: () {
                              if(formKey.currentState!.validate())
                                {
                                    ShopLoginCubit.get(context).userLogin(
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
                                navigetTo(context,RegisterShopScreen());
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
