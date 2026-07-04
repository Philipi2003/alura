import 'package:flutter/material.dart';

class Sectiontitle extends StatelessWidget{
  final String title;
  const Sectiontitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(title, style: TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.bold,
          fontSize: 18
        ));
  }
}