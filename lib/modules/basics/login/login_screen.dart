import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../shared/components/components.dart';


class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
var emailController=TextEditingController();

var passwordController=TextEditingController();

var formKey=GlobalKey<FormState>();
var isPassword=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(),
      body:Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Login",
                    style:TextStyle(
                      fontSize:40,
                      fontWeight:FontWeight.bold
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  /*
                  TextFormField(
                    controller:emailController ,
                    keyboardType:TextInputType.emailAddress,
                    onFieldSubmitted:(String value){
                      print(value);
                    },
                    onChanged:(String value){
                      print(value);
                    },
                    decoration: InputDecoration(
                      labelText: "Email Address",
                      border: OutlineInputBorder(),
                        prefixIcon:Icon(
                            Icons.email,
                        ),
                    ),
                    validator:(value){
                        if( value==null || value.isEmpty){
                          return"email must not be empty";
                        }
                          return null;
                    },
                  ),*/
                  defultTextFormField(
                      controller: emailController,
                      label: "Email Address",
                      prefix: Icons.email,
                      type: TextInputType.emailAddress,
                      validate: (value){
                        if(value==null || value.isEmpty)
                          {
                            return"email must not be empty";
                          }
                        return null;
                      },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
/*
                  TextFormField(
                    controller: passwordController,
                    keyboardType:TextInputType.visiblePassword,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(),
                      prefixIcon:Icon(
                        Icons.lock,
                      ),
                      suffixIcon: Icon(
                        Icons.remove_red_eye,
                      ),

                    ),
                    validator:(value){
                      if( value==null || value.isEmpty){
                        return"password must not be empty";
                      }
                      return null;
                    },
                  ),
*/
                  defultTextFormField(
                    controller: passwordController,
                    label: "Password ",
                    prefix: Icons.lock,
                    type: TextInputType.visiblePassword,
                    isPassword: isPassword,
                    suffix:isPassword? Icons.remove_red_eye:Icons.remove_red_eye_outlined,
                    suffixPressed: (){
                      setState(() {
                        isPassword=!isPassword;
                      });
                    },
                    validate: (value){
                      if(value==null || value.isEmpty)
                      {
                        return"Password must not be empty";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  defultButton(
                      function: () {
                        if(formKey.currentState!=null?.validate()) {
                                print(emailController.text);
                                print(passwordController.text);
                        }
                      },
                      text: "login",
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Dont\' have an account',
                      ),
                      TextButton(
                        onPressed: (){},
                        child: const Text(
                          'Register Now',
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
