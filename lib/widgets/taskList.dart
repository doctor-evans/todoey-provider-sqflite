import 'package:flutter/material.dart';
import 'package:todey/models/task_data.dart';
import 'package:todey/models/tasks.dart';
import 'package:todey/widgets/dbhelper.dart';
import 'package:todey/widgets/task_tile.dart';
import 'package:provider/provider.dart';

class TasksList extends StatelessWidget {
  static const String title = 'Database Handling';

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        final handler = DatabaseHandler();

        return FutureBuilder(
          future: handler.retrieveTaskList(),
          builder: (BuildContext context, AsyncSnapshot<List<Task>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return TaskTile(
                    isChecked: snapshot.data![index].isDone,
                    taskTitle: snapshot.data![index].name,
                    taskItem: snapshot.data![index],
                  );
                },
                itemCount: snapshot.data?.length,
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        );
      },
    );
  }
}
