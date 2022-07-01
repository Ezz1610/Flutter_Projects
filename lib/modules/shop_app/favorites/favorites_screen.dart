import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/shop_app/cubit/shop_cubit.dart';
import 'package:shop_app/layout/shop_app/cubit/shop_states.dart';
import 'package:shop_app/models/shop%20App/get_favorites_model.dart';
import 'package:shop_app/shared/components/components.dart';

import '../../../shared/styles/colors.dart';

class FavoritesScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
     return BlocConsumer<ShopCubit,ShopStates>(
         builder:(context,state) {
           var cubitShop=ShopCubit.get(context);
           return ConditionalBuilder(
               condition:cubitShop.homeModel !=null && state is! ShopGetLoadingStateFavorites,
               builder:(context)=> ListView.separated(
                   itemBuilder:(context,index)=> buildFavItem(cubitShop.getFavModel!.data1!.data2[index],context),
                   separatorBuilder:(context,index)=> myDivider(),
                   itemCount: cubitShop.getFavModel!.data1!.data2.length),
               fallback:(context)=> const Center(child: CircularProgressIndicator()),
           );
         },
         listener: (context,state){}
     );

  }
  Widget buildFavItem(ItemDataFav model,context)=> SingleChildScrollView(
    physics:const BouncingScrollPhysics(),
    child: Padding(

      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: 120,
        child:Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Image(
                  image: NetworkImage(model.productFav.image),
                  width: 120,
                  height: 120,
                ),
                if(model.productFav.discount !=0)
                  Container(
                    color: Colors.red,
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child:const Text(
                      "Discount",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 8

                      ),
                    ),
                  ),

              ],
            ),//image with container
            //Spacer(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    model.productFav.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 14,
                        height: 1.3
                    ),

                  ),//name of product
                  Spacer(),

                  Row(
                    children: [

                      Text(
                        "${model.productFav.price}",
                        style: const TextStyle(
                          fontSize: 14,
                          color: defaultColor,
                        ),

                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      if(1!=0)
                        Text(
                          "${model.productFav.oldPrice}",
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),


                        ),
                      const Spacer(),
                      IconButton(
                        onPressed: (){
                          ShopCubit.get(context).changeFavorites(model.productFav.id);
                          // print(model.id);
                        },
                        icon:   CircleAvatar(
                            backgroundColor:ShopCubit.get(context).favoriteMap[model.productFav.id] ?defaultColor:Colors.grey,
                            radius: 15,
                            child: const Icon(
                              Icons.favorite_border,
                              color: Colors.white,
                            )
                        ),

                      ),




                    ],
                  ),//icon and price
                ],
              ),
            ),

          ],
        ),
      ),
    ),
  );
}
