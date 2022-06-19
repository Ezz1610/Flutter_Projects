
import 'dart:ffi';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:train/layout/news_app/cubit/cubit.dart';
import 'package:train/shared/cubit/cubit.dart';
import 'package:train/shared/styles/brokns_icons.dart';

import '../../modules/news_app/web_view/web_view_screen.dart';

Widget defultButton({
   double width=double.infinity,
   Color background=Colors.blue,
   bool isUpperCase=true,
  double raduis=0,
  double height=40,
  required Function() function,
  required String text,
})=>
Container(
  width: width,
  height: height,
child: MaterialButton(
  onPressed: function,
child:Text(
    isUpperCase?text.toUpperCase():text,
style:const TextStyle(
color: Colors.white,
),

),
),
  decoration:BoxDecoration(
    borderRadius: BorderRadius.circular(raduis,),
    color: background,

  ),
);

Widget defultTextFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function(String) ?onFieldSubmit,
  Function(String) ?onChange,
  required String label,
  required IconData prefix,
  required Function validate,
  bool isPassword =false,
   IconData ?suffix,
  Function ?suffixPressed,
    Function ?onTap,

})=> TextFormField(
controller:controller ,
keyboardType:type,
onFieldSubmitted:onFieldSubmit,
obscureText:isPassword,
  onChanged:onChange ,
decoration: InputDecoration(
labelText: label,
border: OutlineInputBorder(),
prefixIcon:Icon(
  prefix,
),
   /* suffixIcon:Icon(
      suffix,
    ),*/
 suffixIcon:suffix!=null?IconButton(

   onPressed:()
     {
       suffixPressed!();
     },
   icon: Icon(
        suffix
    ),
 ):null,
),
  validator:(s){
    validate(s);
    return null;
  },
   onTap:(){
  Function onTap;
   },

);
void navigetTo(context,widget)=> Navigator.push(context, MaterialPageRoute(
    builder:(context) => widget,
  ),);
void navigetToAndFinish(context,widget)=> Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(
  builder:(context) => widget,
),
    (Route<dynamic>route)=>false,
);


Widget buildTaskItem(Map modle ,context)=>Dismissible(
  key: Key(modle['id'].toString()),
    child:   Padding(
  
    padding: const EdgeInsets.all(20.0),
  
    child: Row(
  
      children:  [
  
         CircleAvatar(
  
          radius:40,
  
          child:Text(
  
           ' ${modle['time']}',
  
          ) ,
  
        ),
  
        const SizedBox(
  
          width: 10,
  
        ),
  
        Expanded(
  
          child: Column(
  
            mainAxisSize:MainAxisSize.min,
  
            crossAxisAlignment: CrossAxisAlignment.start,
  
            children: [
  
              Text(
  
                "${modle["title"]}",
  
                style: const TextStyle(
  
                  fontWeight: FontWeight.bold,
  
                  fontSize: 25,
  
                ),
  
              ),
  
              Text(
  
                "${modle["date"]}",
  
                style: const TextStyle(
  
                  color: Colors.grey,
  
                ),
  
              ),
  
            ],
  
          ),
  
        ),
  
        IconButton(
  
            onPressed: (){

             AppCubit.get(context).updateDatabase(
  
                 status: "done",
  
                 id: modle['id'],
  
             );
  
            },
  
            icon: const Icon(
  
              Icons.check_box,
  
              color: Colors.green,
  
            ),
  
        ),
  
        IconButton(
  
          onPressed: (){
  
            AppCubit.get(context).updateDatabase(
  
                status: "archive",
  
                id:  modle['id'],
  
            );
  
          },
  
          icon: const Icon(
  
            Icons.archive_sharp,
  
            color: Colors.grey,
  
          ),
  
        ),
  
      ],
  
    ),
  
  ),
    onDismissed:(direction)
    {
      AppCubit.get(context).deleteDataFromDatabase(id: modle['id']);
    }

);


Widget tasksBuilder( {
  required List<Map> tasks,
})=>ConditionalBuilder(
  condition: tasks.isNotEmpty,
  builder: (context)=>ListView.separated(
      itemBuilder: (context, index)=> buildTaskItem(tasks[index],context),
      separatorBuilder: (context,index)=>myDivider(),
      itemCount: tasks.length),
  fallback: (context)=>Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: const [
        Icon(
          Icons.menu,
          color:Colors.grey ,
          size: 60,
        ),
        Text(
          "please inter data",
        ),
      ],
    ),
  ),
);
//List<BottomNavigationBarItem> ?items;

List<BottomNavigationBarItem> navBarItems({
   IconData ?icon1,
   String ?labelData1,
   IconData ?icon2,
   String ?labelData2,
   IconData ?icon3,
   String ?labelData3,
   IconData ?icon4,
   String ?labelData4,
   IconData ?icon5,
   String ?labelData5,
  List<BottomNavigationBarItem> ?items,
})
{
  return(
  items=[
    if( labelData1!=null)
      BottomNavigationBarItem(
     icon: Icon(
       icon1,
     ),
     label: labelData1,
   ),
    if( labelData2!=null)
      BottomNavigationBarItem(
     icon: Icon(
       icon2,
     ),
     label: labelData2,

   ),
    if( labelData3!=null)
      BottomNavigationBarItem(
     icon: Icon(
         icon3 ),
     label: labelData3,

   ),
    if( labelData4!=null)
    BottomNavigationBarItem(
      icon: Icon(
          icon4 ),
      label: labelData4,

    ),
    if( labelData5!=null)
      BottomNavigationBarItem(
        icon: Icon(
            icon5 ),
        label: labelData5,

      ),
   ]
  );




}

Widget buildArticleItem(artic,context)=>InkWell(
  onTap: (){
    navigetTo(context, WebViewScreen(artic["url"]));
  },
  child:   Padding(

    padding: const EdgeInsets.all(20.0),

    child: Row(

      children: [

        Expanded(

          child: Container(

            height: 120,

            width: 120,

            decoration:  BoxDecoration(

              borderRadius: BorderRadius.circular(10),

              image:  DecorationImage(

                image: NetworkImage("${artic['urlToImage']}"),

                fit: BoxFit.cover,

              ),

            ),

          ),

        ),

        Expanded(

          child: Column(

            mainAxisSize: MainAxisSize.min,

            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              Text(

                "${artic['title']}",

                style: Theme.of(context).textTheme.bodyText1,

                overflow: TextOverflow.ellipsis,

                maxLines: 3,

              ),

              Text(

                  "${artic['publishedAt']}",

                style: TextStyle(

                  color: Colors.grey,

                  fontWeight: FontWeight.normal,

                  fontSize: 12,

                ),

              ),



            ],

          ),

        ),

      ],

    ),

  ),
);
Widget articleBuilder(list,context,{isSearch=false})=> ConditionalBuilder
(
condition:list.length>0 ,
builder:(context)=>ListView.separated(
physics: const BouncingScrollPhysics(),
itemBuilder:(context,index)=> buildArticleItem(list[index],context),
separatorBuilder: (context,index)=>myDivider(),
itemCount: list.length,
),
fallback:(context)=>isSearch?Container(): const Center(child: CircularProgressIndicator(),),
);

Widget defultTextButton({
  required  Function() function,
  required String text,
})=>TextButton(child: Text(text), onPressed: function);



Widget defaultAppar({
  required BuildContext context,
  String? title,
  List<Widget>?actions,


})=>AppBar(
  title:Text(title!),
  actions:actions,
 leading: IconButton(
     onPressed: (){
       Navigator.pop(context);
     },
    icon: Icon(
      IconBroken.Arrow___Left_2,
    ),

 ),
);


Widget myDivider()=> Container(
  width: double.infinity,
  color: Colors.grey[300],
  height: 1,

);//make a line seperate
