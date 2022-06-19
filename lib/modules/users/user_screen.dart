

import 'package:flutter/material.dart';

import '../../models/users/users_modle.dart';



class UserScreen extends StatelessWidget {

  List<UserModle> users =[
    UserModle(
      id: 1,
      name: "mohamed",
      phone: 01019879413,
    ),
    UserModle(
      id: 2,
      name: "amr",
      phone: 01019879413,
    ),    // this item back end and this item is opj from class UM
    UserModle(
      id: 3,
      name: "omar",
      phone: 01019879413,
    ),    // this item back end and this item is opj from class UM
// this item back end and this item is opj from class UM
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text(
          "Users",
        ),
      ) ,
      body:ListView.separated
        (
        itemBuilder: (context,index) => buildUserItem(users[index]),
        separatorBuilder: (context,index) => Padding(
          padding: const EdgeInsetsDirectional.only(
            start: 20,
          ),
          child: Container(
            height: 1,
            width:double.infinity,
            color: Colors.grey,
          ),
        ),
        itemCount: users.length,
      ),
    );
  }
  Widget buildUserItem(UserModle user) =>Padding(
    padding: const EdgeInsets.all(20),
    // this item front end
    child: Row(
      children: [
        CircleAvatar(
          radius: 25,
          child:Text(
            "${user.id}",
            style: TextStyle(
              fontWeight:FontWeight.bold,
              fontSize:25,
            ),
          ),

        ),
        SizedBox(
          width: 20,
        ),
        Column(
          mainAxisSize:MainAxisSize.min,
          children: [
            Text(
              user.name,
              style: TextStyle(
                fontWeight:FontWeight.bold,
                fontSize:25,
              ),
            ),
            Text(
              "${user.phone}",
              style:TextStyle(
                color: Colors.grey,
              ),
            ),

          ],
        ),
      ],
    ),
  );
}

