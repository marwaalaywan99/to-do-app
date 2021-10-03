import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/models/tasks_data.dart';
import 'package:to_do_app/widgets/tasks_tile.dart';

class TasksList extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Consumer<TasksModel>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TaskTile(
              task
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
