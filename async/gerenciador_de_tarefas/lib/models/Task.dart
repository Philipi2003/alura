class Task {
  String id;
  String title;
  String description;
  bool isCompleted;

  Task({required this.id,required this.title,required this.description,required this.isCompleted});

  factory Task.fromMap(Map<String,dynamic> map){
    return Task(id: map['id'], title: map['title'], description: map['description'], isCompleted: map['isCompleted']);
  }

  Map<String,dynamic> toMap(){
    return{
      "id": id,
      "title": title,
      "description": description,
      "isCompleted": isCompleted
    };
  }
}