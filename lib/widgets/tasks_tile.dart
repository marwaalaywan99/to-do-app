import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/data/tasks_class.dart';
import 'package:to_do_app/components/custom_dialog.dart';
import 'package:to_do_app/constants/colors.dart';
import 'package:to_do_app/models/tasks_data.dart';
import 'package:to_do_app/screens/tasks_screens/edit_task_screen.dart';

class TaskTile extends StatelessWidget{
  
  final Tasks task;
  final Color colorTask;

  TaskTile(this.task, this.colorTask);

  Widget build(BuildContext context) {
    return Card(
      color: colorTask,
      child: ListTile(
        title: Text(task.taskName,
          style: TextStyle(
            color: kTaskTitleColor,
              decoration: task.markedAsDone ? TextDecoration.lineThrough : null),),
        trailing: IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: (){
              return showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CustomDialog(
                      listItems: tasksMoreListView(context, task),
                    );
                  });
            }),
      ),
    );
  }

  Widget tasksMoreListView(context, Tasks task) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      ListView(
        shrinkWrap: true,
        children: [
          SimpleDialogOption(
            child: const Text('Edit', style: kDialogTextStyle),
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditTaskScreen(task: task),
                ),
              );
            },
          ),
          SizedBox(
            height: 10.0,
          ),
          SimpleDialogOption(
            child: const Text('Delete', style: kDialogTextStyle),
            onPressed: () {
              Navigator.of(context).pop();
              deleteConfirmationDialog(context);
            },
          ),
          SizedBox(
            height: 10.0,
          ),
          task.markedAsDone == true ? Text('')
          : SimpleDialogOption(
            child: const Text('Mark as done', style: kDialogTextStyle),
            onPressed: () {
              Navigator.pop(context);
              markDoneDialog(context);
            },
          ),
        ],
      )
    ]);
  }

  Future<void> deleteConfirmationDialog(context) {
    return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Warning"),
            titleTextStyle:
            TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black, fontSize: 20),
            actionsOverflowButtonSpacing: 20,
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    deleteDialog(context);
                  },
                  child: Text("Yes")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Cancel")),
            ],
            content: Text("Are you sure you want to delete this task ?"),
          );
        });
  }

  Future<void> deleteDialog(context) {
    return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Success"),
            titleTextStyle:
            TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black, fontSize: 20),
            actionsOverflowButtonSpacing: 20,
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Provider.of<TasksModel>(context, listen:false).deleteTask(task);
                    Navigator.of(context).pop();
                  },
                  child: Text("Done")),
            ],
            content: Text("Task deleted successfully !"),
          );
        });
  }

  Future<void> markDoneDialog(context) {
    return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Success"),
            titleTextStyle:
            TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black, fontSize: 20),
            actionsOverflowButtonSpacing: 20,
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Provider.of<TasksModel>(context, listen:false).markAsDone(task);
                    Navigator.of(context).pop();
                  },
                  child: Text("Done")),
            ],
            content: Text("Task marked as done !"),
          );
        });
  }

}