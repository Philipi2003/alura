import 'package:flutter/material.dart';
import 'package:initial/models/NavItems.dart';
import 'package:initial/screens/widgets_de_conteudo.dart';
import 'package:initial/screens/widgets_de_layout.dart';

final List<NavItem> items = [
  NavItem(description: "Contém widgets de conteúdos",name: "Widgets de conteúdo",icon: Icons.content_copy,route: WidgetsDeConteudo()),
  NavItem(description: "Contém widgets de layout",name: "Widgets de layout",icon: Icons.layers_outlined, route: WidgetsDeLayout())
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Widgets de layout"),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 0.85,
        children: items.map((item){
          return GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => item.route)),
            child: Card(
              elevation: 4,
              child: Padding(
                padding: EdgeInsetsGeometry.all(8),
                child: Column(
                  children: [
                    Icon(item.icon,size: 16,),
                    Text(item.name),
                    Text(item.description,style: TextStyle(color: Colors.grey),)
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
