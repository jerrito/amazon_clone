
import 'package:amazon_clone/amazone/presentation/pages/dash_board.dart';
import 'package:flutter/material.dart';

import '../amazone/presentation/pages/account_screen.dart';
import '../amazone/presentation/pages/admin/add_products.dart';
import '../amazone/presentation/pages/auth_screen.dart';
import '../amazone/presentation/widgets/bottombar.dart';

Route<dynamic> generateRoute(RouteSettings settings){

  switch(settings.name){
    case AuthScreen.routeName:
      return MaterialPageRoute(builder: (ctx)=>
      const AuthScreen());

    case DashBoardScreen.routeName:
      return MaterialPageRoute(builder: (ctx)=>
      const DashBoardScreen());
    case BottomBar.routeName:
      return MaterialPageRoute(builder: (ctx)=>
      const BottomBar());
    case AccountScreen.routeName:
      return MaterialPageRoute(builder: (ctx)=>
      const AccountScreen());
    case AddProducts.routeName:
      return MaterialPageRoute(builder: (ctx)=>
      const AddProducts());


    default:
      return MaterialPageRoute(builder: (ctx)=>
      const Scaffold(
        body: Center(child:
        Text("Page Not Found")),
      ));

  }




}