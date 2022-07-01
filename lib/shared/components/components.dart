
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:social_app/shared/cubit/cubit.dart';
import 'package:social_app/shared/styles/brokns_icons.dart';


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
