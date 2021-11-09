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
            final now = DateTime.now();
            final time = taskData.tasks[index].taskDate;
            if(now.year == time.year && now.month == time.month && now.day == time.day){
              final task = taskData.tasks[index];
              return TaskTile(
                  task
              );
            }
            else{
              return Text('No Tasks for today');
            }
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }


}
