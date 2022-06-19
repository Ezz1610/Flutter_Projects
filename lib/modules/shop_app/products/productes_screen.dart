
import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:train/layout/shop_app/cubit/shop_cubit.dart';
import 'package:train/layout/shop_app/cubit/shop_states.dart';
import 'package:train/models/shop%20App/categories_model.dart';
import 'package:train/models/shop%20App/home_modle.dart';

import '../../../shared/styles/colors.dart';

class ProductsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
      listener: (context,state){
        if(state is ShopChangeSuccessFavorites)
          {
            if(state.model.status==false)
              {
                Fluttertoast.showToast(
                    msg:state.model.message,
                  backgroundColor: Colors.red,

                );
              }
          }
      },
        builder: (context,state){
        var cubitShop=ShopCubit.get(context);
          return ConditionalBuilder(
            condition:ShopCubit.get(context).homeModel != null &&
                ShopCubit.get(context).categoriesModel != null ,
            builder: (context) => productsBuilder(cubitShop.homeModel!,cubitShop.categoriesModel!,context),
            fallback: (context) => Center(child: CircularProgressIndicator()),
          );
        },

    );
  }

  Widget productsBuilder(HomeModel model , CategoriesModel catModel,context)=>SingleChildScrollView(
    physics: const BouncingScrollPhysics(),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CarouselSlider(
          items:model.data!.banners.map((e) =>
              Image(
                image: NetworkImage(e.image),

                width: double.infinity,
                fit: BoxFit.cover,
              )).toList(),

          options: CarouselOptions(
            viewportFraction: 1,
            height: 250,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds:3),
            autoPlayAnimationDuration:const Duration(seconds: 1),
            autoPlayCurve: Curves.easeInOutBack,
            scrollDirection: Axis.horizontal,



          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Categories",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
                  Container(
                    height:100 ,
                         child:ListView.separated(
                           scrollDirection: Axis.horizontal,
                           physics:  BouncingScrollPhysics(),
                             itemBuilder:(context,index)=> builderCategoryItem(catModel.data1.data2[index]),
                             separatorBuilder: (context,index)=>SizedBox(
                               width: 10,
                             ),
                             itemCount:catModel.data1.data2.length),
                  ),
              const SizedBox(
                height: 20,
              ),

              const Text(
                "New Products",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),

        Container(
          color: Colors.grey[300],
          child: GridView.count(
            shrinkWrap: true,
            physics:  const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 1.1,
            crossAxisSpacing: 1,
            childAspectRatio: 1/1.55,
            children: List.generate(
                    model.data!.products.length,//length of list
                    (index) =>buildGridProducts(model.data!.products[index],context),
            ),

          ),
        ),
      ],
    ),
  );
   Widget builderCategoryItem(DataOfCategoryData data2Categories)=>Stack(
     alignment: AlignmentDirectional.bottomCenter,
     children: [
       Image(
         image: NetworkImage("${data2Categories.image}"),
         width: 100,
         height:100 ,
       ),
       Container
         (
         color: Colors.black.withOpacity(0.7),
         width: 100,
         child:  Text(
           "${data2Categories.name}",
           textAlign:TextAlign.center,
           overflow: TextOverflow.ellipsis,
           style:TextStyle(color: Colors.white),
         ),
       ),
     ],
   );




  Widget buildGridProducts(ProductModel model , context)=>Container(
    color: Colors.white,
    child: Column
      (
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            Image(
              image: NetworkImage(model.image),
              width: double.infinity,
              height: 200,
            ),
            if(model.discount!=0)
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
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontSize: 14,
                    height: 1.3
                ),

              ),
              Row(
                children: [
                  Text(
                    "${model.price}",
                    style: const TextStyle(
                      fontSize: 14,
                      color: defaultColor,
                    ),

                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  if(model.discount!=0)
                    Text(
                      "${model.oldPrice}",
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),


                    ),
                  const Spacer(),
                  IconButton(
                    onPressed: (){
                      ShopCubit.get(context).changeFavorites(model.id);
                      print(model.id);
                    },
                    icon:   CircleAvatar(
                      backgroundColor:ShopCubit.get(context).favoriteMap[model.id] ?defaultColor:Colors.grey,
                        radius: 15,
                        child: const Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                        )
                    ),

                  ),




                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );

}

