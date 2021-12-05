import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internship_project/providers/todo_list_provider.dart';
import 'package:intl/intl.dart';

class BottomDialogWidget extends StatefulWidget {
  const BottomDialogWidget({Key? key, required this.todoListController})
      : super(key: key);

  final TodoListProvider todoListController;

  @override
  _BottomDialogWidgetState createState() => _BottomDialogWidgetState();
}

class _BottomDialogWidgetState extends State<BottomDialogWidget> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    return Padding(
      padding: EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20,
          bottom: mediaQuery.viewInsets.bottom + 50),
      child: SizedBox(
        height: mediaQuery.size.height * 0.35,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  hintText: "Title",
                  border: const OutlineInputBorder(),
                  hintStyle: GoogleFonts.comfortaa(),
                ),
                controller: _titleController,
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "Description",
                  border: const OutlineInputBorder(),
                  hintStyle: GoogleFonts.comfortaa(),
                ),
                controller: _descriptionController,
                onSubmitted: (_) {
                  submitData(context, widget.todoListController,
                      _titleController, _descriptionController);
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Consumer(builder: (context, WidgetRef ref, _) {
                    final todoListConsumerController =
                        ref.watch(todoListProvider);
                    if (todoListConsumerController.dateString == "") {
                      return Text("No Date Selected",
                          style: GoogleFonts.comfortaa());
                    } else {
                      return Text(
                        "Picked Date : ${todoListConsumerController.dateString}",
                        style: GoogleFonts.comfortaa(),
                      );
                    }
                  }),
                  const SizedBox(
                    width: 10,
                  ),
                  TextButton(
                    onPressed: () {
                      pickDate(context, widget.todoListController);
                    },
                    child: Text("Pick Date",
                        style:
                            GoogleFonts.comfortaa(fontWeight: FontWeight.w700)),
                  ),
                ],
              ),
              ElevatedButton.icon(
                label: Text(
                  "Add Item",
                  style: GoogleFonts.comfortaa(
                      color: Colors.white, fontWeight: FontWeight.w700),
                ),
                icon: const Icon(Icons.verified),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.teal),
                ),
                onPressed: () {
                  submitData(context, widget.todoListController,
                      _titleController, _descriptionController);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void submitData(BuildContext context, TodoListProvider todoListController,
    titleController, descriptionController) { 
  todoListController.addTodo(titleController.text, descriptionController.text,
      todoListController.date);
  titleController.clear();
  descriptionController.clear();
  Navigator.of(context).pop();
}

void pickDate(BuildContext context, TodoListProvider todoListController) {
  showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2019),
          lastDate: DateTime.now())
      .then((DateTime? value) {
    if (value == null) {
      return;
    } else {
      todoListController.date = value;
      todoListController.dateString = DateFormat.yMd().format(value);
      todoListController.update();
    }
  });
}
