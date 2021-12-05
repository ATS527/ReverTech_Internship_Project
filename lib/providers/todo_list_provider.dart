import 'package:flutter/cupertino.dart';
import 'package:internship_project/models/todo_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final todoListProvider = ChangeNotifierProvider<TodoListProvider>((ref) {
  return TodoListProvider();
});

class TodoListProvider extends ChangeNotifier {
  String dateString = "";
  DateTime date = DateTime.now();

  List<TodoModel> todoList = [
    // TodoModel(title: "test", description: "testDescription", time: DateTime.now()),
    // TodoModel(title: "test", description: "testDescription", time: DateTime.now()),
    // TodoModel(title: "test", description: "testDescription", time: DateTime.now()),
    // TodoModel(title: "test", description: "testDescription", time: DateTime.now()),
    // TodoModel(title: "test", description: "testDescription", time: DateTime.now()),
    // TodoModel(title: "test", description: "testDescription", time: DateTime.now()),
    // TodoModel(title: "test", description: "testDescription", time: DateTime.now()),
    // TodoModel(title: "test", description: "testDescription", time: DateTime.now()),
    // TodoModel(title: "test", description: "testDescription", time: DateTime.now()),
    // TodoModel(title: "test", description: "testDescription", time: DateTime.now()),
    // TodoModel(title: "test", description: "testDescription", time: DateTime.now()),
    // TodoModel(title: "test", description: "testDescription", time: DateTime.now()),
    // TodoModel(title: "test", description: "testDescription", time: DateTime.now()),
    // TodoModel(title: "test", description: "testDescription", time: DateTime.now()),
    // TodoModel(title: "test", description: "testDescription", time: DateTime.now()),
    // TodoModel(title: "test", description: "testDescription", time: DateTime.now()),
    // TodoModel(title: "test", description: "testDescription", time: DateTime.now()),
    // TodoModel(title: "test", description: "testDescription", time: DateTime.now()),
    // TodoModel(title: "test", description: "testDescription", time: DateTime.now()),
    // TodoModel(title: "test", description: "testDescription", time: DateTime.now()),
  ];

  void addTodo(String title, String description, DateTime date) {
    todoList.add(
      TodoModel(
        title: title,
        description: description,
        time: date,
      ),
    );
    update();
  }

  void deleteTodo(TodoModel todo) {
    for (int i = 0; i < todoList.length; i++) {
      if (todoList[i] == todo) {
        todoList.removeAt(i);
      }
    }
    update();
  }

  void update() {
    notifyListeners();
  }
}
