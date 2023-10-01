import 'package:amazon_clone/amazone/presentation/widgets/single_product.dart';
import 'package:flutter/material.dart';

import '../../../constants/global_variables.dart';
import '../../../res/assets_res.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  List images=[
    AssetsRes.PHOTOSHARING,
    AssetsRes.PIZZAMAKER,
    AssetsRes.REFERAFRIEND,

  ];
  @override
  Widget build(BuildContext context) {
    return  Column(

      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Your orders",style: TextStyle(
                fontWeight: FontWeight.w600,
              ),textAlign: TextAlign.start,),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("See all",style: TextStyle(
                fontWeight: FontWeight.w600,
                color: GlobalVariables.selectedNavBarColor
              ),textAlign: TextAlign.start,),
            ),
          ],
        ),
        Container(
          height:170,
          padding: EdgeInsets.only(left: 10,top: 20,right:0),
          child: ListView.builder(
            scrollDirection:Axis.horizontal,
            itemCount: 3,
              itemBuilder: (context, index){
                return SingleProduct(src:images[index],);
          }),
        )



      ],
    );
  }
}
