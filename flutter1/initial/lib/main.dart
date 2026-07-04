import 'package:flutter/material.dart';
import 'package:initial/models/NavItems.dart';
import 'package:initial/screens/ciclo_stateful_parent.dart';
import 'package:initial/screens/widgets_de_conteudo.dart';
import 'package:initial/screens/widgets_de_layout.dart';
import 'package:initial/screens/ciclo_stateful.dart';

final List<NavItem> items = [
  NavItem(description: "Contém widgets de conteúdos",name: "Widgets de conteúdo",icon: Icons.content_copy,route: WidgetsDeConteudo()),
  NavItem(description: "Contém widgets de layout",name: "Widgets de layout",icon: Icons.layers_outlined, route: WidgetsDeLayout()),
  NavItem(name: "Ciclo de vida", description: "Testa os ciclos de vida", icon: Icons.sync, route: CicloStatefulParent())
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Initial',
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
        title: Text("Home"),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(16),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 0.85,
          crossAxisSpacing: 16,
          children: items.map((item){
            return GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => item.route)),
              child: Card(
                elevation: 4,
                child: Padding(
                  padding: EdgeInsetsGeometry.all(8),
                  child: Column(
                    children: [
                      Expanded(child:Icon(item.icon,size: 64,)),
                      Text(item.name),
                      Text(item.description,style: TextStyle(color: Colors.grey),textAlign: TextAlign.center,)
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      )
    );
  }
}
