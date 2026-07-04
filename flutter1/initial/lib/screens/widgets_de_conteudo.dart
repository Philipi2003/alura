import 'package:flutter/material.dart';
import 'package:initial/main.dart';
import 'package:initial/widgets/section_title.dart';


class WidgetsDeConteudo extends StatelessWidget{
  WidgetsDeConteudo({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Widgets de conteúdo"),
        leading: GestureDetector(
          onTap: () => Navigator.push(context,MaterialPageRoute(builder: (_) => HomePage())),
          child: Icon(Icons.arrow_back_ios, size: 24, color: Colors.black,)
        ),
      ),
      body: Column(
      children: [
        Sectiontitle(title: "Textos"),
        Text("Texto qualquer"),

        Divider(),
        Sectiontitle(title: "Imagens"),
        Image(image: Image.network("https://picsum.photos/200").image),

        Divider(),
        Sectiontitle(title: "Icons"),
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
          Icon(Icons.favorite),
          Icon(Icons.star),
          Icon(Icons.exit_to_app)
        ],)
      ],),
    );
  }
}