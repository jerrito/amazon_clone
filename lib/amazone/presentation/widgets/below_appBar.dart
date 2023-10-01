import 'package:flutter/material.dart';

import '../../../constants/global_variables.dart';

class BelowAppBar extends StatelessWidget {
  const BelowAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.only(left:10,right: 10,bottom: 10),
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient:GlobalVariables.appBarGradient,
      ),
      child: RichText(text: const TextSpan(
        style:TextStyle(color:Colors.black,fontSize: 18),
        text:"Hello, ",
        children: [
          TextSpan(
            text:"Admin"
          )
        ]
      ),


      ),

    );
  }
}
