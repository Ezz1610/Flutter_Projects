import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:train/shared/cubit/states.dart';

import '../../modules/todo_app/archive_tasks/archive.dart';
import '../../modules/todo_app/done_tasks/done.dart';
import '../../modules/todo_app/new_tasks/tasks.dart';
import '../network/local/cash_helper.dart';


class AppCubit extends Cubit<AppStates>
{

  AppCubit() : super(AppInitialState());
  // create function from type AppCubit and this function take context and return object from type AppCubit
  // function name is:get(context)
  // object name is:BlocProvider.of(context)
  // This function take context because of the object need context
  static AppCubit get(context)=>BlocProvider.of(context);

  List<Widget>bodyScreen=[
    NewTasksScreen(),
    DoneTasks(),
    ArchiveTasks(),
  ];
  List<String>title=[
    "New Tasks",
    "Done Tasks",
    "Archive Tasks",
  ];
  int currentIndex=0;

  void changeIndex(int index){
   currentIndex=index;
   emit(AppChangeBottomNavbarState());
  }


  late Database database;
  List<Map> newTasks=[];
  List<Map> doneTasks=[];
  List<Map> archiveTasks=[];

  void createDatabase()
  {
    openDatabase(
        "Todo.db",
        version: 1,
        onCreate: (database,version)
        {
          if (kDebugMode) {
            print("database created");
          }
          database.execute('CREATE TABLE tasks (id INTEGER PRIMARY KEY,title TEXT,date TEXT,time TEXT,status TEXT)').then((value)
          {
            if (kDebugMode) {
              print("table created");
            }


          }).catchError((error){

            if (kDebugMode) {
              print("the error is${error.toString()}");
            }

          });
        },
        onOpen: (database){

          getDataFromDatabase(database);
          if (kDebugMode) {
            print("database opened");
          }
        }
    ).then((value) {
      database=value;
      emit(AppCreateDatabaseState());
    });

  }

   insertDatabase({
    required String title,
    required String time,
    required String date,
  }) async
  {
     await database.transaction((txn) => txn.rawInsert
      ("INSERT INTO tasks(title,date,time,status) VALUES('$title','$date','$time','new')").then((value)
    {
      emit(AppInsertDatabaseState());
      getDataFromDatabase(database);
      if (kDebugMode) {
        print("database opened");
      }

      if (kDebugMode) {
        print("inserted successfully");
      }
    }).catchError((error)
    async {
      if (kDebugMode) {
        print("error is ${error.toString()}");
      }
    })


    );
  }
  void getDataFromDatabase(database){
    newTasks=[];
    doneTasks=[];
    archiveTasks=[];
    emit(AppGetDatabaseLoadingState());
     database.rawQuery("SELECT * FROM tasks").then((value){
      //value return map of item
       value.forEach((element)
           {
             if(element['status']=='new')
             {
               newTasks.add(element);
               print(element['status']);

             }
             else if (element['status']=='done')
             {
               doneTasks.add(element);
               print(element['status']);

             }
             else
             {
                archiveTasks.add(element);
               print(element['status']);

             }

           }
       );
      /* for(var element in value)
       {
         if(element['status']=='new')
         {
           newTasks.add(element);
         }
         else if(element['status']=='done')
         {
           doneTasks.add(element);
         } else
         {
           archiveTasks.add(element);
         }

       }*/
      emit(AppGetDatabaseState());
    });


  }
  void updateDatabase({
  required String status,
  required int id,
}) async
  {
     database.rawUpdate(
        'UPDATE tasks SET status = ? WHERE id = ?',
        [status, id],).then((value) {
       getDataFromDatabase(database);
       emit(AppUpdateDatabaseState());
     });

  }
  void deleteDataFromDatabase
  ({
      required int id,
  })
  {
    database.rawDelete('DELETE FROM tasks WHERE id = ?', [id]).then((value) {
      getDataFromDatabase(database);
      emit(AppDeleteDatabaseState());
    });
  }
  bool isBottomSheet=false;
  late IconData iconType=Icons.edit ;
  void changeBottomSheetState
      ({
          required bool isBottom,
          required IconData icon,
       })
       {
         isBottomSheet=isBottom;
         iconType=icon;
         emit(AppChangeBottomSheetState());
       }
  bool isDark=false;
  void changeMood ({bool ?fromShard})//note:the value of fromShard send when Run main Not when call void changeMood
  {
    if(fromShard!=null)
      {
        isDark=fromShard;
        emit(AppChangeMoodStates());
      }
    else
      {
         isDark=!isDark;

         CashHelper.putBoolean(key: "dark", value: isDark).then((value) {
           emit(AppChangeMoodStates());
         });

      }
print(fromShard);
  }


}
