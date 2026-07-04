import 'package:flutter/material.dart';
import 'package:initial/screens/ciclo_stateful.dart';

class CicloStatefulParent extends StatefulWidget {
  CicloStatefulParent({super.key});

  @override
  State<CicloStatefulParent> createState() => _CicloStatefulParentState();
}

class _CicloStatefulParentState extends State<CicloStatefulParent> {
  Color corAtual = Colors.blue;

  void trocarCor(){
    setState(() {
      corAtual = corAtual == Colors.blue ? Colors.purple : Colors.blue;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ciclo de vida: pai"),),
      body: Column(
        children: [
          Text("Testando"),
          Divider(),
          CicloStateful(cor: corAtual),
          Divider(),
          ElevatedButton(onPressed: trocarCor, child: Text("Trocar cor")),
        ],
      ),
    );
  }
}