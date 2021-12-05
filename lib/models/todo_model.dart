class TodoModel {
  String title;
  String description;
  DateTime time;
  bool isFinished;

  TodoModel(
      {required this.title,
      required this.description,
      required this.time,
      this.isFinished = false});
}
