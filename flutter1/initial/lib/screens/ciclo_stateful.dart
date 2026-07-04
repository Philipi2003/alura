import 'package:flutter/material.dart';

class CicloStateful extends StatefulWidget {
  const CicloStateful({super.key, required this.cor});

  final Color cor;
  @override
  State<CicloStateful> createState() => _CicloStatefulState();
}

class _CicloStatefulState extends State<CicloStateful> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("initState: state inicializado");
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("didChangeDependencies: mudança nas dependências");
  }

  @override
  void didUpdateWidget(covariant CicloStateful oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget: o widget foi atualizado");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("dispose: o stato foi excluído");
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 200, height: 200,child: Container(color: widget.cor),);
  }
}