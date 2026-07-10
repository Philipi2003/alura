import 'package:flutter/material.dart';

class CarouselItem extends StatelessWidget {
  final String imagePath;
  final String text;
  const CarouselItem({super.key, required this.imagePath, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset("assets/images/$imagePath"),
        Text(text, style: TextStyle(
          fontWeight: FontWeight.w500,
          fontFamily: "Bigelow Rules",
          fontSize: 36,
          color: Colors.white
        ),)
      ],
    );
  }
}