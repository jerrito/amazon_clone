import 'package:flutter/material.dart';

import '../../../res/assets_res.dart';

class DealOfTheDay extends StatelessWidget {
  const DealOfTheDay({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Deal Of The Day",
          textAlign: TextAlign.start,),
        ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.asset(AssetsRes.PHOTOSHARING,
          height: 200,
          fit: BoxFit.fitWidth,
          width: double.infinity,),
        ),
        const Text("\$999"),
        const Text("Apple Mac Boo Pro the"),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ClipRRect(child:Image.asset(AssetsRes.PIZZAMAKER,
                height: 100,width: 200,fit: BoxFit.fitWidth,) ,),
              ClipRRect(child:Image.asset(AssetsRes.PIZZAMAKER,
                height: 100,width: 200,fit: BoxFit.fitWidth,) ,),
              ClipRRect(child:Image.asset(AssetsRes.PIZZAMAKER,
                height: 100,width: 200,fit: BoxFit.fitWidth,) ,),
              ClipRRect(child:Image.asset(AssetsRes.PIZZAMAKER,
                height: 100,width: 200,fit: BoxFit.fitWidth,) ,),
            ],
          ),
        )




      ],
    );
  }
}
