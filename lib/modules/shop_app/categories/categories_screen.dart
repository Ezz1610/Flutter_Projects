import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:train/layout/shop_app/cubit/shop_cubit.dart';
import 'package:train/layout/shop_app/cubit/shop_states.dart';
import 'package:train/models/shop%20App/categories_model.dart';
import 'package:train/shared/components/components.dart';

import '../../../models/shop App/categories_model.dart';

class CategoriesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:BlocConsumer<ShopCubit,ShopStates>(
          listener: (context, state) {},
        builder: (context,state){
            var cubitShop=ShopCubit.get(context);
        return  ListView.separated(
              physics:const BouncingScrollPhysics(),
              itemBuilder:(context,index)=> buildCatItem(cubitShop.categoriesModel!.data1.data2[index]),//data2[index] is: objects
              separatorBuilder:(context,index)=>myDivider(),
              itemCount: cubitShop.categoriesModel!.data1.data2.length);
        },
      ) ,
    );
  }
  Widget buildCatItem(DataOfCategoryData data2Categories)=>Row(
    children: [
      Image(
        image: NetworkImage(data2Categories.image),
        width: 100,
        height: 100,
        fit: BoxFit.cover,
      ),
      SizedBox(
        width: 20,
      ),
      Spacer(),

      Text(data2Categories.name),
      Icon(
          Icons.arrow_forward_ios
      ),

    ],
  );
}
