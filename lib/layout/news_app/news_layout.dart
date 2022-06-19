

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../modules/news_app/search/search_screen.dart';
import '../../shared/components/components.dart';
import '../../shared/cubit/cubit.dart';
import 'cubit/cubit.dart';
import 'cubit/news_states.dart';

class NewsLayout extends StatelessWidget {


  @override

  Widget build(BuildContext context) {

    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context, state) {},
      builder: (context,state){
        var cubit=NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              "News App",
            ) ,
            actions: [
              IconButton
                (
                onPressed: (){
                  navigetTo(context, SearchScreen(),);
                },
                icon:  Icon(
                  Icons.search,
                ),
              ),
              IconButton
                (
                onPressed: (){
                  AppCubit.get(context).changeMood();//note:no value send with the function changeMood(fromShard=null)
                },
                icon: const Icon(
                  Icons.brightness_4_outlined,
                ),
              ),
            ],


          ),
          body:cubit.Screens[cubit.currentIndex],
          bottomNavigationBar:BottomNavigationBar(
           // type: BottomNavigationBarType.fixed,
            currentIndex:cubit.currentIndex ,//the initial value of currentIndex=0 from cubit
            items:
            navBarItems(
              icon1: Icons.business, labelData1: "business",//onTap the index=0
              icon2: Icons.sports, labelData2: "sports",//onTap the index=1
              icon3: Icons.science, labelData3: "science",//onTap the index=2
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