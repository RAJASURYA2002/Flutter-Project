import 'package:flutter/material.dart';
import 'package:todoey/widgets/task_view.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({super.key, this.addTaskCallBack});
  final Function? addTaskCallBack;
  @override
  Widget build(BuildContext context) {
    String textValue = "";
    return Container(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Add Task",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: 30.0,
                  fontWeight: FontWeight.w700),
            ),
            TextField(
              onChanged: (value) => {textValue = value},
              autofocus: true,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.lightBlueAccent,
                      width: 5.0), // Set the bottom border width here
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextButton(
              onPressed: () {
                addTaskCallBack!(textValue);
              },
              style: TextButton.styleFrom(
                fixedSize: Size(double.infinity, 30.0),
                backgroundColor: Colors.lightBlueAccent,
              ),
              child: Text(
                "Add",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
