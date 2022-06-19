import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessengerScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 20,
        title:Row(
          children: [
            CircleAvatar(
              radius:20 ,
              backgroundImage: NetworkImage("https://avatars.githubusercontent.com/u/93315446?s=96&v=4"),
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              "Chats",
                  style:TextStyle(
                color: Colors.black,
            ),
            ),
          ],
        ),
        actions: [
          CircleAvatar(
            radius: 15,
            backgroundColor: Colors.blue,
            child: IconButton(onPressed: (){}, icon:Icon(
              Icons.camera_alt,
              size: 15,
              color: Colors.white,

            )),
          ),
          SizedBox(
            width: 15,
          ),
          CircleAvatar(
            radius: 15,
            backgroundColor: Colors.blue,
            child: IconButton(onPressed: (){}, icon:Icon(
              Icons.edit,
              size: 15,
              color: Colors.white,

            )),
          ),

        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10) ,
                  color: Colors.grey[400],

                ),
                padding: EdgeInsets.all(5),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                    ),
                    Text(
                        "search",

                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 110,

                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder:(context,index)=> buildStoryItem(),
                    separatorBuilder:(context,index)=>SizedBox(
                      width: 20,
                    ),
                  itemCount: 15,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                    itemBuilder:(context,index)=>buildChatItem(),
                    separatorBuilder:(context,index)=>SizedBox(
                      height: 20,
                    ),
                    itemCount: 15,
                ),

            ],
          ),
        ),
      ),
    );
  }
  // 1. build item
  // 2. build list
  // 3. add items to list

  Widget buildChatItem()=>Row(
    children: [
      Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          CircleAvatar(
            radius:30 ,
            backgroundImage: NetworkImage("https://scontent-hbe1-1.xx.fbcdn.net/v/t39.30808-6/270254455_109382041612529_4193416290837390656_n.jpg?_nc_cat=106&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=lb1FjG_SpmkAX_LCoVV&_nc_ht=scontent-hbe1-1.xx&oh=00_AT84UJbHiC-txs84kooUigIDPrFRLwymaFlKMN1XfnKR_Q&oe=622D7E6C"),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(
              bottom: 3,
              end: 3,
            ),
            child: CircleAvatar(
              radius: 5,
              backgroundColor: Colors.green,

            ),
          ),
        ],

      ),
      SizedBox(
        width: 20,
      ),
      Expanded(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(

              "Omar Elsapah",
              maxLines: 2,
              overflow:TextOverflow.ellipsis ,
              style:TextStyle(
                fontWeight:FontWeight.bold,
              ) ,
            ),
            Row(
              children: [
                Text(
                  "انت فين يسطا",
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "10:06 pm",
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    width: 7,
                    height: 7,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape:BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    ],
  );
  Widget buildStoryItem()=>Container(
    width:60 ,
    child: Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              radius:30 ,
              backgroundImage: NetworkImage("https://scontent-hbe1-1.xx.fbcdn.net/v/t39.30808-6/270254455_109382041612529_4193416290837390656_n.jpg?_nc_cat=106&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=lb1FjG_SpmkAX_LCoVV&_nc_ht=scontent-hbe1-1.xx&oh=00_AT84UJbHiC-txs84kooUigIDPrFRLwymaFlKMN1XfnKR_Q&oe=622D7E6C"),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                bottom: 3,
                end: 3,
              ),
              child: CircleAvatar(
                radius: 5,
                backgroundColor: Colors.green,

              ),
            ),
          ],

        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Omar Elsapah ElsapahElsapahElsapahElsapahElsapah",
          maxLines: 2,
          overflow:TextOverflow.ellipsis ,
        ),
      ],
    ),
  );
/*
*
*
* */

}
