import 'package:amazon_clone/amazone/presentation/pages/admin/prod_post.dart';
import 'package:flutter/material.dart';

import '../../../../constants/global_variables.dart';
import '../../../../res/assets_res.dart';
import '../../widgets/text_fields.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor:
        GlobalVariables.selectedNavBarColor,
        leading:Image.asset(AssetsRes.AMAZON_IN,
        width: 30,height: 30,),
        actions: const [Padding(
          padding: EdgeInsets.only(right:10.0),
          child: Center(
            child: Text("Admin",
            style:TextStyle(fontSize:20,color:Colors.black)),
          ),
        )],
      ),
      body: _pages[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: pageIndex,
          selectedItemColor: GlobalVariables.selectedNavBarColor,
          unselectedItemColor: GlobalVariables.unselectedNavBarColor,
          backgroundColor: GlobalVariables.backgroundColor,
          onTap: updatePage,
          items:[
            BottomNavigationBarItem(
                icon: Container(
                  width: bottomBarWidth,
                  decoration: BoxDecoration(
                      border: Border(
                          top:BorderSide(
                              color:pageIndex==0?
                              GlobalVariables.selectedNavBarColor:
                              GlobalVariables.backgroundColor,
                              width: bottomBorderBarWidth
                          ))
                  ),
                  child: const Icon(Icons.home_outlined),
                ),
                label: "Home"
            ),

            BottomNavigationBarItem(
                icon: Container(
                  width: bottomBarWidth,
                  decoration: BoxDecoration(
                      border: Border(
                          top:BorderSide(
                              color:pageIndex==1?
                              GlobalVariables.selectedNavBarColor:
                              GlobalVariables.backgroundColor,
                              width: bottomBorderBarWidth
                          ))
                  ),
                  child: const Icon(Icons.analytics_outlined),
                ),
                label: "Analytics"
            ),
            BottomNavigationBarItem(
                icon: Container(
                  width: bottomBarWidth,
                  decoration: BoxDecoration(
                      border: Border(
                          top:BorderSide(
                              color:pageIndex==2?
                              GlobalVariables.selectedNavBarColor:
                              GlobalVariables.backgroundColor,
                              width: bottomBorderBarWidth
                          ))
                  ),
                  child: const Icon(Icons.all_inbox_outlined),
                ),
                label: "Order"
            ),

          ] ),
    );
  }
  int pageIndex=0;
  double bottomBarWidth=24;
  double bottomBorderBarWidth=5;
  final List<Widget> _pages=[
    const ProductsPost(),
    const Center(
        child:Text("Analytics Page")
    ),
    const Center(
        child:Text("Orders")
    ),

  ];
  updatePage(int page){
    setState(() {
      pageIndex=page;
    });
  }
}
