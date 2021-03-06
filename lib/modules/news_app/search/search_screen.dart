import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:train/layout/news_app/cubit/cubit.dart';
import 'package:train/layout/news_app/cubit/news_states.dart';

import '../../../shared/components/components.dart';


class SearchScreen extends StatelessWidget {
var searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>
      (
      builder:(context,state) 
       {
      var list=NewsCubit.get(context).search;

      return Scaffold(
      appBar: AppBar(),
      body:Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: defultTextFormField(
              controller: searchController,
              type:TextInputType.text,
              label: "Search",
              prefix: Icons.search,
              validate:(String value){
                if(value.isEmpty){
                  return "Search Must Not Be Empty";
                }
                else {
                  return null;
                }
              },
              onChange: (value)
              {
                NewsCubit.get(context).getSearch(value);
              },
            ),
          ),
          Expanded(child: articleBuilder(list, context,isSearch: true))
        ],
      ) ,
    );
      },
        listener: (context,state){},
    );
  }
}
