import 'package:flutter/material.dart';

import 'carousel.dart';

class CategoryImage extends StatelessWidget {
  final String img;
  final String str;
  const CategoryImage({super.key, required this.img, required this.str});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        CircleAvatar(
            radius: 25,
            backgroundImage: Image.asset(img).image),
        Text(str,style:const TextStyle(fontSize:12)),

      ],
    );
  }
}
