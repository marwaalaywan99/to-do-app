import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/models/tasks_data.dart';
import 'package:to_do_app/widgets/tasks_tile.dart';

class TasksList extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Consumer<TasksModel>(
      builder: (context, taskData, child) => FutureBuilder(
        future: taskData.fetchData(),
        builder: (context, snapshot) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasksData[index];
            return TaskTile(
              task
            );
          },
          itemCount: 2,
        );
      },
    )
    );
  }
}
