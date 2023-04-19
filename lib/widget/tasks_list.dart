import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task.dart';
import '../models/task_data.dart';
import 'tasks_tile.dart';

class TasksList extends StatefulWidget {
  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  List<Task> tasks = [
    Task(name: 'Buy milk'),
    Task(name: 'Buy egg'),
    Task(name: 'Buy bread'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
            taskTitle:
                Provider.of<TaskData>(context, listen: false).tasks[index].name,
            isChecked: Provider.of<TaskData>(context, listen: false)
                .tasks[index]
                .isDone,
            checkboxCallback: (checkboxState) {
              setState(() {
                Provider.of<TaskData>(context, listen: false)
                    .tasks[index]
                    .toggleDone();
              });
            },
            LongPressCallback: () {
              Provider.of<TaskData>(context, listen: false).deleteTask(
                  Provider.of<TaskData>(context, listen: false).tasks[index]);
            });
      },
      itemCount: Provider.of<TaskData>(context, listen: false).tasks.length,
    );
  }
}
