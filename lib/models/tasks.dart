class Task {
  final int? id;
  final String name;
  int isDone;

  Task({required this.name, this.isDone = 0, this.id});

  factory Task.fromMap(Map<dynamic, dynamic> json) =>
      new Task(id: json['id'], name: json['name'], isDone: json['isDone']);

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'isDone': isDone};
  }

  void toggleDone() {
    isDone = 1 - isDone;
  }
}
