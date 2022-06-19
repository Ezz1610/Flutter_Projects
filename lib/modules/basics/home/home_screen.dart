
import 'dart:ffi';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget
{

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
         Icons.menu
        ),
        title: const Text(
          "The Lord Of The Rings"
        ),
        actions: [
          IconButton(onPressed: onNotification, icon: const Icon(
              Icons.menu
          )),
          const Icon(
            Icons.search
          ),
        ],
        centerTitle: true,
      ),

      body:Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width:400,
              decoration:BoxDecoration(
                  borderRadius:BorderRadius.circular(10),
              ),
              clipBehavior:Clip.antiAliasWithSaveLayer,
              child: Stack(
                alignment:Alignment.bottomCenter,
                children: [
                  const Image(
                    image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRonGNvaNQPzu2P8MRokN3N65b5KHmyj9gegg&usqp=CAU"),
                    fit: BoxFit.cover,
                    width: 400,
                    height: 400,
                  ),
                  Container(
                    padding: const EdgeInsetsDirectional.only(),
                    width: double.infinity,
                    color: Colors.orangeAccent.withOpacity(.4),

                    child: const Text(
                      "The Lord Of The Rings",
                      textAlign: TextAlign.center,
                      style:TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

        ],
      ),

    );
  }
void onNotification(){
    print("notification clicked");
}
 }