
import 'package:flutter/material.dart';

class SingleProduct extends StatelessWidget {
  final String src;
  const SingleProduct({super.key, required this.src});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        border: Border.all(
          color:Colors.black12,
          width: 1.5
        )
      ),
      child:ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Image.asset(src,
        fit: BoxFit.fitHeight,width: 180,),

      ) ,
    );
  }
}
