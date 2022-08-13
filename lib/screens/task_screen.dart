import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:todey/models/constants.dart';
import 'package:todey/models/task_data.dart';
import 'package:todey/screens/bottomsheet_screen.dart';
import 'package:todey/widgets/taskList.dart';

class TaskScreen extends StatelessWidget {
  final daysDate = (DateFormat.yMMMd().format(DateTime.now()));

  static const String title = 'Database Handling';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kfillColor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: kfillColor,
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => BottomScreen(),
          );
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Alert(
                      context: context,
                      desc: "Do you want clear your tasks?",
                      buttons: [
                        DialogButton(
                            child: Text(
                              "Yes",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () {
                              Provider.of<TaskData>(context, listen: false)
                                  .clearTask();

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
                  child: CircleAvatar(
                    child: Icon(
                      Icons.list,
                      size: 30.0,
                      color: kfillColor,
                    ),
                    backgroundColor: Colors.white,
                    radius: 30.0,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  "Todoey",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                // Text(
                //   '${Provider.of<TaskData>(context).taskListCount}',
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontSize: 18,
                //   ),
                // ),
                // SizedBox(
                //   height: 10,
                // ),
                Text(
                  daysDate,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                )),
            child: TasksList(),
          ))
        ],
      ),
    );
  }
}
