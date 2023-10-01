import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:amazon_clone/amazone/presentation/manager/user_provider.dart';

import '../../../constants/global_variables.dart';
import '../../../res/assets_res.dart';
import '../widgets/carousel.dart';
import '../widgets/category.dart';
import '../widgets/deal_of_day.dart';
import '../widgets/text_fields.dart';
class DashBoardScreen extends StatefulWidget{
  static const String routeName="/dashBoard";
  const DashBoardScreen({super.key});
  @override
 State<DashBoardScreen> createState()=> _HomeScreen();
}

class _HomeScreen extends State<DashBoardScreen>{

  List image=[
    AssetsRes.BOOKS,
    AssetsRes.ELECTRONICS,
    AssetsRes.MOBILES,
    AssetsRes.ESSENTIALS,
    AssetsRes.FASHION,
  ];
  UserProvider? userProvider;
  @override
  Widget build(BuildContext context){
   final user=Provider.of<UserProvider>(context).user;
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
        GlobalVariables.selectedNavBarColor,
        title:Container(
          width:300,
          height: 40,
          color:Colors.white,
          child: PrimaryTextFormField(
            hintText: "Search Amazon",
            prefix:Icon(Icons.search,color:Colors.black) ,
          ),
        ) ,
        actions: [Icon(Icons.mic)],
      ),
      body:SingleChildScrollView(
        child: Column(
         // mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Center(
              child: Text(user.toJson()),
            ),
            Center(
              child: Text(user.token),
            ),
            Container(
              color:GlobalVariables.selectedNavBarColor,
              child: Row(
                children:[
                  Icon(Icons.location_on_outlined),
                  Text("Delivery to admin, - Fake wall street"),

                ]
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:[
                  CategoryImage(img: image[0],
                    str: 'BOOKS',
                  ),
                  CategoryImage(img: image[1],
                    str: 'ELECTRONICS',),
                  CategoryImage(img: image[2],
                    str: 'MOBILES',),
                  CategoryImage(img: image[3],
                    str: 'ESSENTIALS',),
                  CategoryImage(img: image[4],
                    str: 'Fashion',),

                ]
              ),
            ),
            SizedBox(height:20),

            const CarouselGet(),
            SizedBox(height:20),
            const DealOfTheDay()


          ]
        ),
      )


    );
  }

}