import 'package:flutter/foundation.dart';
import 'package:todey/models/tasks.dart';
import 'package:todey/widgets/dbhelper.dart';

class TaskData extends ChangeNotifier {
  final handler = DatabaseHandler();
  void addTask(String newTaskTitle) {
    Task task = Task(name: newTaskTitle);
    handler.insertTask(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    handler.update(task);
    notifyListeners();
  }

  void deleteTask(Task taskitem) {
    handler.remove(taskitem.id);
    notifyListeners();
  }

  void clearTask() {
    handler.removeall();
    notifyListeners();
  }
}
