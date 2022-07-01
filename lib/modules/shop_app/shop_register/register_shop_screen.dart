import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../layout/shop_app/shop_layout.dart';
import '../../../shared/components/components.dart';
import '../../../shared/components/constants.dart';
import '../../../shared/network/local/cash_helper.dart';
import '../products/productes_screen.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';


class RegisterShopScreen extends StatelessWidget {
  var emailController=TextEditingController();
  var passwordController=TextEditingController();
  var nameController=TextEditingController();
  var phoneController=TextEditingController();

  var formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>ShopRegisterCubit(),
      child: BlocConsumer<ShopRegisterCubit,ShopRegisterStates>(
        listener: (context, state) {
          if(state is ShopRegisterSuccessState)
          {
            if(state.modelRegister.status==true)
            {

              CashHelper.saveData(key: "token", value: state.modelRegister.data!.token).then((value){


                token=state.modelRegister.data?.token;
                navigetToAndFinish(context,ShopLayout());

                print("yessssssssssssssssssssssssyyyyyyyyyyyyyyyyyyeeeeeeeeee");
              });
              Fluttertoast.showToast(
                  msg: state.modelRegister.message!,
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
              Fluttertoast.showToast(
                  msg: state.modelRegister.message!,
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

          return Scaffold(
            appBar: AppBar(),
            body:Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding:  const EdgeInsets.all(20),
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
                        suffix: ShopRegisterCubit.get(context).suffix,
                        isPassword:  ShopRegisterCubit.get(context).isPassword,//obscure
                        suffixPressed: ()
                        {
                          ShopRegisterCubit.get(context).changePasswordVisibility();


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
                          ShopRegisterCubit.get(context ).userRegister(
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
                        condition:state is! ShopRegisterLoadingState  ,
                        builder: ( context) => defultButton(
                            text: "Register",
                            function: () {

                                   ShopRegisterCubit.get(context).userRegister(
                                     emailAddress: emailController.text,
                                     password: passwordController.text,
                                     name: nameController.text,
                                     phone: phoneController.text,
                                   );

                                   print(emailController.text);


                            }

                        ),
                        fallback: ( context)=>const Center(child: CircularProgressIndicator()),
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
/*
class RegisterShopScreen extends StatelessWidget {
  var emailController=TextEditingController();
  var passwordController=TextEditingController();
  var nameController=TextEditingController();
  var phoneController=TextEditingController();
  var formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context)=>ShopRegisterCubit(),
      child: BlocConsumer<ShopRegisterCubit,ShopRegisterStates>(

        listener: (context, state) {

          if(state is ShopRegisterSuccessState)
          {
            print('fuckkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk');

            if(state.model.status==true)
            {
              print('nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn');

              CashHelper.saveData(key: "token", value: state.model.data?.token).then((value){
                navigetToAndFinish(context,ShopLayout());
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
                        suffix: ShopRegisterCubit.get(context).suffix,
                        isPassword:  ShopRegisterCubit.get(context).isPassword,//obscure
                        suffixPressed: ()
                        {
                          ShopRegisterCubit.get(context).changePasswordVisibility();


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
                          ShopRegisterCubit.get(context ).userRegister(
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
                        condition:state is! ShopRegisterLoadingState,
                        builder: (BuildContext context) => defultButton(
                            text: "register",
                            function: () {
                            if(formKey.currentState!.validate())
                              {
                                ShopRegisterCubit.get(context).userRegister(
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
