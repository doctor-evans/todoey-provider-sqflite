import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:todey/models/constants.dart';
import 'package:todey/models/task_data.dart';
import 'package:todey/models/tasks.dart';

class TaskTile extends StatelessWidget {
  final int isChecked;
  final String taskTitle;
  final Task taskItem;

  TaskTile(
      {required this.isChecked,
      required this.taskTitle,
      required this.taskItem});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onLongPress: () {
          Alert(
            context: context,
            desc: "Do you want to delete this task?",
            buttons: [
              DialogButton(
                  child: Text(
                    "Yes",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: () {
                    Provider.of<TaskData>(context, listen: false)
                        .deleteTask(taskItem);
                    Navigator.pop(context);
                  },
                  color: Colors.redAccent),
              DialogButton(
                child: Text(
                  "No",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () => Navigator.pop(context),
                color: kfillColor,
              )
            ],
          ).show();
        },
        title: Text(
          taskTitle,
          style: TextStyle(
            decoration: isChecked == 1 ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Checkbox(
          activeColor: kfillColor,
          value: isChecked == 1 ? true : false,
          onChanged: (value) {
            Provider.of<TaskData>(context, listen: false).updateTask(taskItem);
          },
        ));
  }
}
