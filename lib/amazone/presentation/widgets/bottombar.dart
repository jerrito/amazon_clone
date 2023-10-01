import 'package:flutter/material.dart';

import '../../../constants/global_variables.dart';
import '../../../main.dart';
import '../pages/account_screen.dart';
import '../pages/dash_board.dart';

class BottomBar extends StatefulWidget {
  static const String routeName="/bottomBar";
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int pageIndex=0;
  double bottomBarWidth=24;
  double bottomBorderBarWidth=5;
final List<Widget> _pages=[
  const DashBoardScreen(),
 const AccountScreen(),
  const Center(
      child:Text("Cart")
  ),

];
   updatePage(int page){
    setState(() {
      pageIndex=page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                  child: const Icon(Icons.person_outlined),
                ),
                label: "Account"
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
                  child:const Badge(
                    label: Text("2"),
                    child: Icon(
                      Icons.shopping_cart
                    ),
                  ),
                ),
                label: "Cart"
            ),
          ] ),
    );
  }
}
