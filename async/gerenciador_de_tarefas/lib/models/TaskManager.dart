import 'dart:async';

import 'package:gerenciador_de_tarefas/models/Task.dart';

StreamController<String> streamController = StreamController<String>();

class TaskManager {
    final List<Task> _listTasks = []; // Perceba que "Task" ainda não existe.
    
    addTask(Task task) {
        _listTasks.add(task);
        streamController.add("Task ${task.id} adicionada com sucesso");
    }
    
    toggleTaskStatus(String id) {
        int index = _listTasks.indexWhere((task) => task.id == id);
        Task task = _listTasks[index];
        task.isCompleted = !task.isCompleted;
        _listTasks[index] = task;
        streamController.add("Task ${task.id} teve seu status alterada para ${task.isCompleted}");
    }
    
    List<Task> getAll(){
        streamController.add("Leitura de todas as taks");
        return _listTasks;
    }
    
    Task getById(String id) {
        streamController.add("Busca da task com id $id");
        return _listTasks.firstWhere((task) => task.id == id);
    }
    
    delete(String id) {
        _listTasks.removeWhere((task) => task.id == id);
        streamController.add("Task com id $id foi removida");
    }
}