import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_own_todo/constants.dart';
import 'package:provider/provider.dart';

import '../objects/task.dart';
import '../objects/task_list_provider.dart';

class EditTaskScreen extends StatelessWidget {
  final Color color;
  String oldTaskTitle;
  Task currentEditableTask;
  Null description;

  EditTaskScreen(
      {required this.color,
      required this.oldTaskTitle,
      required this.currentEditableTask,
      this.description});


  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        child: Icon(
          FontAwesomeIcons.penToSquare,
          color: color,
          size: 19,
        ),
        onTap: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        children: [
                          TextField(
                            style: KtextfieldStyle,
                            decoration: InputDecoration(
                              hintText: oldTaskTitle,
                              filled: true,
                              fillColor: Colors.white,
                            ),
                            onChanged: (value) {},
                            onSubmitted: (value) {
                              context
                                  .read<TaskData>()
                                  .editTask(currentEditableTask, value);

                              Navigator.pop(context);
                            },
                          ),
                          TextField(
                            style: KtextfieldStyle,
                            decoration: InputDecoration(
                              hintText: currentEditableTask.taskDescription!=null ? currentEditableTask.taskDescription: 'Enter Your Description',
                              filled: true,
                              fillColor: Colors.white,
                            ),
                            onChanged: (value) {
                              print(value);
                            },
                            onSubmitted: (description) {
                              context.read<TaskData>().addDescription(currentEditableTask, description);
                              // currentEditableTask.taskDescription = description;
                              Navigator.pop(context);
                              print(description);
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: KgreenColor),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Edit Task'),
                          )
                        ],
                      )),
                );
              });
        },
      ),
    );
  }
}
