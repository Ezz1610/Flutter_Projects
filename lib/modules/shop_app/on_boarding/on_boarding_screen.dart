
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/network/local/cash_helper.dart';

import '../../../shared/styles/colors.dart';
import '../shop_login/shop_login_screen.dart';
class BoardingModel {
late String image;
late String title;
late String body;
BoardingModel({
  required this.image,
  required this.title,
  required this.body,
});

}
class OnBoardingScreen extends StatefulWidget {

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  List<BoardingModel>boarding=[
    BoardingModel(
      image:"assets/images/board1.jpg",
      title: "Electronics",
      body: "Buy now from Ezz Market and Get Discounts up to 50% and enjoy choosing from best Electronics Store In Egypt and enjoy easy payments on our sale"
      ,
    ),
    BoardingModel(
      image:"assets/images/board2.jpg",
      title: "Clothes ",
      body: "Get the best online shopping experience for women, men, maternity, kids & baby clothes & home products in Cairo, Alexandria, & all of Egypt from Ezz Market",
    ),
    BoardingModel(
      image:"assets/images/board3.jpg",
      title: "Sports",
      body: "Discover our wide range of sports apparels, accessories, equipment and much more with 60 Days Return/Exchange Policy",
    ),

  ];

  var boardController=PageController();

  bool last=false;
  void onSubmit(){
    CashHelper.saveData(key: "onBoarding", value: "value").then((value) {
      if(value!=null)
      {
        navigetToAndFinish(context, ShopLoginScreen());
      }
    });

  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Ezz Market"),
        actions: [
          defultTextButton(function: onSubmit, text: "SKIP"),
        /*  TextButton
            (
              onPressed: (){
                navigetToAndFinish(context, ShopLoginScreen());

              },
              child:  const Text
                (
                  "SKIP",
                style: TextStyle(
                  color:defaultColor,
                ),
              ),
          ),*/
        ],
      ),
      body:Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                  controller: boardController,
                  itemBuilder:(context, index) =>buildBoardingItem(boarding[index]),
                itemCount: boarding.length,
                onPageChanged: (int index)
                {
                  if(index==boarding.length-1){
                    setState(() {
                      last=true;
                    });
                  }
                  else{
                    setState(() {
                      last=false;
                    });
                  }
                },

              ),
            ),
            Row(
              children: [
                SmoothPageIndicator
                  (
                    effect: const ExpandingDotsEffect(
                      dotColor: Colors.black12,
                        activeDotColor:defaultColor,
                      expansionFactor: 4

                    ),
                    controller: boardController,
                    count: boarding.length,
                ),
                 const Spacer(),
                FloatingActionButton(

                  onPressed: () {
                    //code go to the next page
                    if(last==false)
                      {
                        boardController.nextPage
                          (
                          duration: const Duration(milliseconds: 750),
                          curve: Curves.bounceIn,
                        );
                      }
                    else
                      {
                           //code go to login page
                       onSubmit();
                      }

                  },
                  child: const Icon(
                    Icons.arrow_forward_ios,
                  ),


                ),


              ],
            ),

          ],
        ),
      ),

    );
  }

  Widget buildBoardingItem(BoardingModel model)=>Column (
  crossAxisAlignment: CrossAxisAlignment.start,
  children:[

  Expanded(
  child: Image(
  image: AssetImage(model.image),
  ),
  ),

  Text(
  model.title,
  style:const TextStyle(
  fontSize:25 ,
  fontWeight:FontWeight.bold,
  ) ,
  ),
  const SizedBox(
  height: 20,
  ),
  Text(
  model.body,
  style:TextStyle(
  fontSize:15 ,
  fontWeight:FontWeight.bold,
  ) ,
  ),
  const SizedBox(
  height: 40,
  ),
  ],
  );
}
