import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:to_do_app/data/tasks_class.dart';

class FireStoreService {
  final _firestore = FirebaseFirestore.instance;

  void addTask(Tasks task) {
    _firestore.collection('tasks').add({
      'taskName': task.taskName,
      'taskDate': task.taskDate.toString(),
      'taskTime': task.taskTime.toString(),
      'taskReminder': task.taskReminder,
      'markedAsDone': task.markedAsDone
    });
  }

}