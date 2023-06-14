import 'package:flutter/material.dart';
import 'package:my_own_todo/objects/task_list_provider.dart';
import 'package:my_own_todo/screens/edit_task_screen.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:my_own_todo/constants.dart';

import '../objects/task.dart';
import 'dropdown.dart';

class TasksCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      var screenWidth = MediaQuery.of(context).size.width;
      var screenHeight = MediaQuery.of(context).size.height;
      double safeAreaHeightTop = MediaQuery.of(context).viewInsets.top;
      double safeAreaHeightBottom = MediaQuery.of(context).viewInsets.bottom;

      double safeAreaTotalHeight = safeAreaHeightBottom + safeAreaHeightTop;
      double screenHeightMinusSafeArea = screenHeight - safeAreaTotalHeight;
      return Container(
        width: screenWidth,
        height: screenHeightMinusSafeArea * 0.72,
        // constraints: const BoxConstraints.tightFor(width: 420, height: 450),
        child: ListView.builder(
          // scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            bool isDone = context.read<TaskData>().tasksList[index].isDone;
            Task currentTask = context.read<TaskData>().tasksList[index];
            var condition = index % 2 != 0;

            return Card(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 25),
              shadowColor: condition ? KgreenColor : const Color(0xfff0f0f0),
              color: condition ? KgreenColor : Colors.white,
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Container(
                padding: EdgeInsets.fromLTRB(15,0,15,15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DropdownWidget(
                          dropdownColor:
                              condition ? KlightBlueOnDark : KgreyColor,
                        ),
                        EditTaskScreen(
                          oldTaskTitle: currentTask.taskName,
                          color: condition ? Colors.white : KorangeColor,
                          currentEditableTask: currentTask,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          height: 18,
                          width: 18,
                          child: Checkbox(
                              value: isDone,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3)),
                              side: BorderSide(
                                  color:
                                      condition ? Colors.white : KorangeColor,
                                  width: 2),
                              checkColor: isDone && condition
                                  ? KgreenColor
                                  : Colors.white,
                              activeColor: isDone && condition
                                  ? Colors.white
                                  : KorangeColor,
                              onChanged: (bool? newStateValue) {
                                context
                                    .read<TaskData>()
                                    .toggleDoneProvider(currentTask);
                              }),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: AutoSizeText(
                            currentTask.taskName,
                            style: TextStyle(
                                decorationThickness: 2,
                                decoration: isDone
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: condition ? Colors.white : KorangeColor),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            softWrap: true,
                          ),
                        ),
                        InkWell(
                          child: Icon(
                            FontAwesomeIcons.trashCan,
                            color: condition ? KlightBlueOnDark : KorangeColor,
                            size: 20,
                          ),
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    elevation: 3,
                                    title: const Text('Delete Task?',
                                        style: TextStyle(color: KgreenColor)),
                                    content: const Text(
                                        'Are you sure to delete the task?',
                                        style: TextStyle(color: KgreenColor)),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('Cancel',
                                            style: TextStyle(
                                                color: KgreenColor,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          context
                                              .read<TaskData>()
                                              .deleteTask(currentTask);
                                          Navigator.pop(context);
                                        },
                                        child: const Text(
                                          'Delete',
                                          style: TextStyle(color: KorangeColor),
                                        ),
                                      )
                                    ],
                                  );
                                });
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      currentTask.taskDescription != null
                          ? currentTask.taskDescription
                          : 'No description yet',
                      style: TextStyle(
                          color: condition ? KlightBlueOnDark : KgreyColor),
                    )
                  ],
                ),
              ),
            );
          },
          itemCount: context.watch<TaskData>().tasksList.length,
        ),
      );
    });
  }
}
