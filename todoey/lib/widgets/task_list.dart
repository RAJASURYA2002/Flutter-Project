import 'package:flutter/material.dart';

class TaskList extends StatelessWidget {
   final   bool? isChecked;
  final String? taskName;
  final Function? checkBoxCallBack;
  TaskList({this.taskName, this.isChecked, this.checkBoxCallBack});
  // void checkBoxCallBack(bool? checkBoxState) {

  //   setState(() {
  //     isChecked = checkBoxState!;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(
          taskName!,
          style: TextStyle(
              decoration: isChecked == false
                  ? TextDecoration.none
                  : TextDecoration.lineThrough),
        ),
        trailing: Checkbox(
          value: isChecked,
          activeColor: Colors.lightBlueAccent,
          onChanged: (value) => {
                  checkBoxCallBack!(value)
          },
        ));
  }
}

// class TaskCheckbox extends StatelessWidget {
//   final bool checkBoxState;
//   final Function(bool?) toggleCheckBoxState;
//   TaskCheckbox(
//       {required this.checkBoxState, required this.toggleCheckBoxState});
//   @override
//   Widget build(BuildContext context) {
//     return Checkbox(
//       value: checkBoxState,
//       activeColor: Colors.lightBlueAccent,
//       onChanged: toggleCheckBoxState,
//     );
//   }
// }
