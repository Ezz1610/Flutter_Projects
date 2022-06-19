

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:train/shared/components/components.dart';
import 'package:train/shared/cubit/cubit.dart';
import 'package:train/shared/cubit/states.dart';


class HomeLayout extends StatefulWidget {
  // HomeLayout({Key? key}) : super(key: key);


  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {


  var scaffoldKey=GlobalKey<ScaffoldState>();

  var titleController=TextEditingController();
  var timeController=TextEditingController();
  var dateController=TextEditingController();
  var formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context)=>AppCubit()..createDatabase(),
        child:BlocConsumer<AppCubit,AppStates>(
          listener: (BuildContext context,AppStates state)
          {
            if(state is AppInsertDatabaseState){
              Navigator.pop(context);

            }
          },
          builder:(BuildContext context,AppStates state){
            AppCubit cubit=AppCubit.get(context);

            return Scaffold(
              key: scaffoldKey,
              appBar: AppBar(
                title:  Text(
                 cubit.title[cubit.currentIndex],
                ),
              ),
              body: ConditionalBuilder(
                condition: state is! AppGetDatabaseLoadingState,
                builder: (context)=> cubit.bodyScreen[cubit.currentIndex],//if condition done
                fallback:(context)=>const Center(
                    child: CircularProgressIndicator()
                ),// if condition not done

              ),
              floatingActionButton:FloatingActionButton(
                onPressed: (){
                  if(cubit.isBottomSheet)
                  {
                    if(formKey.currentState!.validate())
                    {
                      cubit.insertDatabase(
                        title: titleController.text,
                        time: timeController.text,
                        date: dateController.text,
                      );
                    }

                  }
                    else
                    {
                        scaffoldKey.currentState?.showBottomSheet((context) => Container(
                              color: Colors.grey[100],
                              child: Form(
                                key: formKey,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    defultTextFormField(
                                      controller: titleController,
                                      type:TextInputType.text,
                                      label: "Task Title",
                                      prefix: Icons.title,
                                      validate: (String value){
                                        if(value.isEmpty)
                                        {
                                          return"title must not be empty";
                                        }
                                        else{
                                          return null;
                                        }
                                      },
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    defultTextFormField
                                      (
                                      controller: timeController,
                                      type:TextInputType.text,
                                      label: "Task time",
                                      prefix: Icons.watch_later,
                                      onTap: ()
                                      {
                                        showTimePicker
                                          (
                                            context: context,
                                            initialTime: TimeOfDay.now()
                                          ).then((value)
                                          {
                                            timeController.text=value!.format(context);
                                                if (kDebugMode)
                                                {
                                                  print(value.format(context));
                                                }
                                          });
                                      },
                                      validate: (String value){
                                        if(value.isEmpty)
                                        {
                                          return"time must not be empty";
                                        }
                                        else{
                                          return null;
                                        }
                                      },
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    defultTextFormField
                                      (
                                      controller: dateController,
                                      type:TextInputType.text,
                                      label: "Task Date ",
                                      prefix: Icons.date_range,
                                      onTap: ()
                                      {
                                        showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime.now(),
                                          lastDate: DateTime.parse("2022-09-13"),
                                        ).then((value) {
                                          if (kDebugMode) {
                                            print ( dateController.text=DateFormat.yMMMd().format(value!)) ;
                                          }
                                        });
                                      },
                                      validate: (String value){
                                        if(value.isEmpty)
                                        {
                                          return"date must not be empty";
                                        }
                                        else{
                                          return null;
                                        }
                                      },

                                    ),
                                  ],
                                ),
                              )
                          ),).closed.then((value)
                        {
                          cubit.changeBottomSheetState
                            (
                              isBottom: false,
                              icon: Icons.edit,
                            );

                        }) ;
                        cubit.changeBottomSheetState
                          (
                              icon: Icons.add,
                              isBottom: true,
                          );
                      }

                },
                child: Icon(
                  cubit.iconType,
                ),
              ),
              bottomNavigationBar:BottomNavigationBar(
                currentIndex:cubit.currentIndex,
                type:BottomNavigationBarType.fixed,
                items:
                  navBarItems(
                      icon1: Icons.menu, labelData1: "Tasks",
                      icon2: Icons.check_circle, labelData2: "Done",
                      icon3:  Icons.archive_sharp, labelData3: "Archive",
                  ),
                 /* BottomNavigationBarItem(
                    icon: Icon(
                      Icons.menu,
                    ),
                    label: "Tasks",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.check_circle,
                    ),
                    label: "Done",

                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.archive_sharp,
                    ),
                    label: "Archive",

                  ),*/


                onTap: (index){
                  cubit.changeIndex(index);

                  if (kDebugMode) {
                    print(index);
                  }
                },
              ),
            );
          },
        ),
    );
  }


}
