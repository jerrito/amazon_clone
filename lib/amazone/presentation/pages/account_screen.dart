import 'package:flutter/material.dart';

import '../../../constants/global_variables.dart';
import '../../../res/assets_res.dart';
import '../widgets/app_buttons.dart';
import '../widgets/below_appBar.dart';
import '../widgets/orders.dart';

class AccountScreen extends StatefulWidget {
  static const String routeName="/accountScreen";
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title:  Row(
            //crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  alignment:Alignment.topLeft,
                  child: Image.asset(AssetsRes.AMAZON_IN,
                  width:140,height:45,color:Colors.black)),
              //SizedBox(height: 30,),
              //Text("Hello, Admin"),
              Row(
                children: [
                  IconButton(onPressed: (){

                  },
                      icon: const Icon(Icons.notifications_outlined)),
                  IconButton(onPressed: (){

                  }, icon:const Icon(Icons.search)),
                ],
              ),
            ],
          ),
        ),
      ),
      body:   Column(
        children:[
          BelowAppBar(),
          SizedBox(height:20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 150,
                child: DefaultPrimaryButton(
                  onPressed: (){

                  },
                  child: Text("Your orders"),
                ),
              ),
              SizedBox(
                width: 150,
                child: DefaultPrimaryButton(
                  onPressed: (){

                  },
                  child: Text("Turn Seller"),
                ),
              ),
            ],
          ),
          SizedBox(height:20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 150,
                child: DefaultPrimaryButton(
                  onPressed: (){

                  },
                  child: Text("Log Out"),
                ),
              ),
              SizedBox(
                width: 150,
                child: DefaultPrimaryButton(
                  onPressed: (){

                  },
                  child: Text("Your Wish List"),
                ),
              ),
            ],
          ),
          SizedBox(height:20),
          Orders(),



        ]
      ),
    );
  }
}
