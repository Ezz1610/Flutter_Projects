import 'dart:math';

import 'package:flutter/material.dart';

import '../bmi_result/bmi_result_screen.dart';

class BmiScreen  extends StatefulWidget {

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}
bool isMale=true;
double height=120;
int age=15;
int weight=50;
class _BmiScreenState extends State<BmiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar:AppBar(
    title: const Text(
       "BMI",
),
    ) ,
      body:Column(
        children: [
          Expanded(


                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: (){
                            setState(() {
                              isMale=true;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: isMale?Colors.blue:Colors.grey[400],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child:
                            Column(
                              children: const [
                                Image(
                                    image:AssetImage("assets/images/male.png"),
                                  height: 90,
                                  width: 90,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                    "male",
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight:FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),

                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: (){
                            setState(() {
                              isMale=false;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: isMale?Colors.grey[400]:Colors.blue,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child:
                            Column(
                              children: const [
                                Image(
                                  image:AssetImage("assets/images/female.png"),
                                  height: 90,
                                  width: 90,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Female",
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight:FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),

                          ),
                        ),
                      ),

                    ],
                  ),
                ),
            ),
          Expanded(
               child:Padding(
                 padding: const EdgeInsets.symmetric(horizontal:20),
                 child: Container
                   (

                   decoration: BoxDecoration(
                       color: Colors.grey[400],
                       borderRadius:BorderRadius.circular(10)
                   ),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: [
                         const Text(
                           "Height",
                           style: TextStyle(
                             fontSize:30,
                             fontWeight: FontWeight.bold,
                           ),
                         ),
                         const SizedBox(
                           height: 10,
                         ),
                         Row(
                           crossAxisAlignment:CrossAxisAlignment.baseline ,
                           textBaseline:TextBaseline.alphabetic,
                           mainAxisAlignment:MainAxisAlignment.center,
                           children: [
                             Text(
                               "${height.round()}",
                               style: const TextStyle(
                                 fontSize:30,
                                 fontWeight: FontWeight.bold,
                               ),
                             ),
                             const SizedBox(
                               width: 5,
                             ),
                             const Text(
                               "cm",
                               style: TextStyle(
                                 fontSize:20,
                               ),),

                           ],
                         ),
                         Slider(
                             min: 80,
                             max:220,
                             value:height,
                             onChanged: (value){
                           setState(() {
                             height=value;
                           });
                         }),
                       ],
                     ),

                 ),
               ),
           ),
          Expanded(child:
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Weight",
                          style:TextStyle(
                           // fontWeight: FontWeight.bold,
                            fontSize:22,
                            fontWeight: FontWeight.bold,

                          ),
                        ),

                        Text(
                          "$weight",
                          style:const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize:30,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              onPressed: (){
                                setState(() {
                                  weight++;
                                });
                              },
                              heroTag:"weight+",
                              child:const Icon(
                                Icons.add,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            FloatingActionButton(
                              onPressed: (){
                                setState(() {
                                  weight--;
                                });
                              },
                              heroTag:"weight-",

                              child:Icon(
                                Icons.horizontal_rule,
                              ),
                            ),


                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Age",
                          style:TextStyle(
                            // fontWeight: FontWeight.bold,
                            fontSize:22,
                            fontWeight: FontWeight.bold,

                          ),
                        ),
                        Text(
                          "${age}",
                          style:TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize:30,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              onPressed: (){
                               setState(() {
                                 age++;
                               });
                              },
                              heroTag:"age+",
                              child:Icon(
                                Icons.add,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            FloatingActionButton(
                              onPressed: (){
                                setState(() {
                                  age--;
                                });
                              },
                              heroTag:"age-",
                              child:Icon(
                                Icons.horizontal_rule,
                              ),
                            ),


                          ],
                        ),
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),
          ),
          Container(
            width: double.infinity,
            decoration:BoxDecoration(
              color: Colors.blue,
            ),
            child: MaterialButton(
              onPressed:() {
                var result = weight/pow(height/100,2);
                 print(result.round());
                 Navigator.push(
                     context,
                     MaterialPageRoute(
                         builder:(context) => bmi_result_screen(
                           age: age,
                           result: result.round(),
                           isMale:isMale ,
                         ),
                     ),
                 );
              },
              child: Text(
                "calc",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],


      ),

    );
  }
}
/*
*  var result = weight/pow(height/100,2);
                        print(result.round());
*
* */