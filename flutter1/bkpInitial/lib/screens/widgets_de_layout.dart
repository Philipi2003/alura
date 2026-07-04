import 'package:flutter/material.dart';
import 'package:initial/widgets/section_title.dart';
import 'package:initial/main.dart';

class WidgetsDeLayout extends StatelessWidget{
  WidgetsDeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Widgets de Layout"),
        leading: GestureDetector(
          onTap: () => Navigator.push(context,MaterialPageRoute(builder: (_) => HomePage())),
          child: Icon(Icons.arrow_back_ios, size: 24, color: Colors.black,)
        ),
      ),
      body: ListView(
        children: [
          Sectiontitle(title: "Padding"),
          Container(
            color: Colors.red,
            child: Column(children: [
              Text("Tamanho total sem padding"),
              Padding(
                padding: EdgeInsetsGeometry.all(10),
                child: Container(
                  color: Colors.blue,
                  child: Text("Tamanho do mesmo container com padding de 10px em todos os lados"),
                ),
              )
            ],),
          ),
          Divider(),
          Sectiontitle(title: "Align"),
          Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Container(child: Text("Container alinhado cima direita"),),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(child: Text("Container alinhado baixo centro"),),
              )
            ],
          ),
          Divider(),
          Sectiontitle(title: "Center"),
          Column(
            children: [
              Center(
                child: Container(child: Text("Container centralizado com center"),),
              ),
            ],
          ),
          Divider(),
          Sectiontitle(title: "SizedBox"),
          Column(
            children: [
              Center(
                child: SizedBox(
                  child: Text("SizedBox com 100px de width e centralizado"),
                  width: 100,
                ),
              ),
            ],
          ),
          Divider(),
        ],
      ),
    );
  }
}