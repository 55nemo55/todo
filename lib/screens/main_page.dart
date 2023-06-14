import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_own_todo/objects/task_list_provider.dart';
import 'package:my_own_todo/screens/add_task_screen.dart';
import 'package:my_own_todo/widgets/task_cards.dart';
import 'package:my_own_todo/objects/task.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class MainPage extends StatelessWidget {
  final today = DateTime.now();
  final String currentDate = DateFormat.yMMMMd().format(DateTime.now());
  final String currentDay = DateFormat('EEEEE', 'en_US').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    int numberOfTasks = context.watch<TaskData>().tasksList.length;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              backgroundColor: Color(0XFFe8e8ea),
              context: context,
              builder: (context) => AddTaskScreen());
        },
        child: Icon(Icons.add),
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        elevation: 5,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      currentDay,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      currentDate,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 35,
                ),
                RichText(
                    text: TextSpan(
                        text: 'You have ',
                        style: KgreenTitleText,
                        children: [
                      TextSpan(
                        text: numberOfTasks.toString(),
                        style: KorangeTitleText,
                      ),
                      TextSpan(text: numberOfTasks <= 1 ? ' task' : ' tasks'),
                      TextSpan(text: ' today')
                    ])),
                const SizedBox(
                  height: 20,
                ),
                TasksCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
