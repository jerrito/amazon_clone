import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../constants/global_variables.dart';

class CarouselGet extends StatelessWidget {
  const CarouselGet({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 200,
      child: CarouselSlider.builder(

          itemBuilder:(BuildContext context,int i,index){
            return ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                    GlobalVariables.carouselImages[i],
                height: 200,
                fit: BoxFit.cover,
                ),
            );
          },
        itemCount: GlobalVariables.carouselImages.length,
        options: CarouselOptions(
          viewportFraction: 0.9,
          height: 200
        ),
      ),
    );
  }
}
