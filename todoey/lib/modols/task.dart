class Task {
  final String? taskname;
  bool isDone = false;
  Task({this.taskname, this.isDone = false});
  void toogleDone() {
    isDone = !isDone;
  }
}
