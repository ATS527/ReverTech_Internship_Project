import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internship_project/constants/text_styles.dart';
import 'package:internship_project/models/todo_model.dart';
import 'package:internship_project/providers/todo_list_provider.dart';
import 'package:intl/intl.dart';

import 'bottom_dialog_widget.dart';

class TodoListPage extends ConsumerWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoListController = ref.watch(todoListProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Todo Page"),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: todoListController.todoList.isEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    "Oops List is empty!!",
                    style: GoogleFonts.comfortaa(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent),
                  ),
                  Image.asset(
                    "assets/images/emptyList.png",
                    fit: BoxFit.cover,
                  ),
                ],
              )
            : ListView.builder(
                itemCount: todoListController.todoList.length,
                itemBuilder: (context, index) {
                  final TodoModel todo = todoListController.todoList[index];
                  return LayoutBuilder(builder: (context, constraints) {
                    return ListTile(
                      leading: Checkbox(
                        onChanged: (value) {
                          todo.isFinished = value!;
                          todoListController.deleteTodo(todo);
                        },
                        value: todo.isFinished,
                      ),
                      title: Text(
                        todo.title,
                        style: GoogleFonts.comfortaa(
                            fontSize: 17, fontWeight: FontWeight.w600),
                        overflow: TextOverflow.clip,
                      ),
                      subtitle: Text(
                        todo.description,
                        style: GoogleFonts.comfortaa(),
                        overflow: TextOverflow.clip,
                      ),
                      trailing: SizedBox(
                        width: constraints.maxWidth * 0.24,
                        child: Text(
                          DateFormat.yMEd().add_jms().format(todo.time),
                          style: kTodoTextStyle,
                        ),
                      ),
                    );
                  });
                }),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(FontAwesomeIcons.solidCalendarPlus),
        onPressed: () {
          showModalBottomSheet(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              context: context,
              builder: (_) {
                return BottomDialogWidget(
                    todoListController: todoListController);
              });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
