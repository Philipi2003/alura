import 'dart:async';

import 'package:gerenciador_de_tarefas/models/TaskManager.dart';
import 'package:gerenciador_de_tarefas/models/Task.dart';

void main (){
  StreamSubscription subscription = streamController.stream.listen((event){
    print(event);
  });

  TaskManager gerenciador = TaskManager();

  gerenciador.addTask(Task.fromMap({"id":"T01","title":"Escovar os dentes", "description": "Higiene básica", "isCompleted": false}));
  gerenciador.addTask(Task.fromMap({"id":"T02","title":"Escovar os cabelos", "description": "Meio opcional", "isCompleted": false}));
  gerenciador.addTask(Task.fromMap({"id":"T03","title":"Comer", "description": "Obrigatório", "isCompleted": false}));

  print(gerenciador.getAll());

  gerenciador.toggleTaskStatus("T01");

  print(gerenciador.getById("T01"));

  gerenciador.delete("T02");

  print(gerenciador.getAll());

}