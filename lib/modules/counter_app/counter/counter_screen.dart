import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'cubit/cubit.dart';
import 'cubit/states.dart';
class CounterScreen  extends StatelessWidget{
  const CounterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (BuildContext context)=>CounterCubit(),
      child: BlocConsumer<CounterCubit,CounterStates>(
        listener:(context, state){},
        builder:(context,state){
          return  Scaffold(
            appBar:AppBar(
              title:Text(
                "Counter",
              ),
            ) ,
            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: (){
                      CounterCubit.get(context).minus();
                      print(CounterCubit.get(context).counter);

                    },
                    child: Text(
                      "Minus",
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
                  Text(
                    "${CounterCubit.get(context).counter}",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: (){


                      CounterCubit.get(context).plus();
                      print(CounterCubit.get(context).counter);
                    },
                    child: Text(
                      "Blus",
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

}
