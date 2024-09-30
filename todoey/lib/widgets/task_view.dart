import 'package:flutter/material.dart';
import 'package:todoey/modols/task.dart';
import 'package:todoey/widgets/task_list.dart';

class Taskview extends StatefulWidget {
  Taskview({this.tasks});
  final List<Task>? tasks;

  @override
  State<Taskview> createState() => _TaskviewState();
}

class _TaskviewState extends State<Taskview> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskList(
            taskName: widget.tasks?[index].taskname,
            isChecked: widget.tasks?[index].isDone,
            checkBoxCallBack: (checkBoxState) {
              setState(() {
                  widget.tasks?[index].toogleDone();
              });
            });
      },
      itemCount: widget.tasks?.length ?? 0,
    );
  }
}


// ListView(
//       children: [
//         TaskList(taskName: tasks[0].taskname,isChecked: tasks[0].isDone,),
//         TaskList(taskName: tasks[1].taskname,isChecked: tasks[1].isDone,),
//         TaskList(taskName: tasks[2].taskname,isChecked: tasks[2].isDone,),
//         TaskList(taskName: tasks[3].taskname,isChecked: tasks[3].isDone,),
//       ],
//     );