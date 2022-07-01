import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/shop_app/cubit/shop_cubit.dart';
import 'package:shop_app/layout/shop_app/cubit/shop_states.dart';
import 'package:shop_app/modules/shop_app/search/search_screen.dart';
import 'package:shop_app/modules/shop_app/shop_login/shop_login_screen.dart';
import 'package:shop_app/shared/network/local/cash_helper.dart';

import '../../shared/components/components.dart';

class ShopLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
        listener:(context,state){} ,
        builder:(context,state) {
          var cubit=ShopCubit.get(context);
        return  Scaffold(
            appBar: AppBar(
              title: const Text(
                "Ezz Market",
              ),
              actions: [
                IconButton(
                    onPressed: (){
                      navigetTo(context,SearchScreen());
                    },
                    icon: const Icon(
                        Icons.search,
                    ),
                ),
              ],
            ),
            body:cubit.screens[ShopCubit.get(context).currentIndex] ,
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              items:
              navBarItems(
                icon1: Icons.home,
                labelData1: "Home",
                icon2: Icons.apps_outlined,
                labelData2: "Categories",
                icon3: Icons.favorite,
                labelData3: "favorite",
                icon4: Icons.settings,
                labelData4: "settings",

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
/*
* TextButton(
        onPressed: (){
          CashHelper.removeData(key: "token").then((value) {
            if(value==true)
              {
                navigetToAndFinish(context,ShopLoginScreen());
              }
          });
        },
        child: const Text("Logout"),
      ),
* */
