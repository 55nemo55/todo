import 'package:flutter/material.dart';
import 'package:my_own_todo/objects/task_list_provider.dart';
import 'package:provider/provider.dart';
import 'package:my_own_todo/constants.dart';


class AddTaskScreen extends StatelessWidget {
  final textFieldController = TextEditingController();

  void clearText() {
    textFieldController.clear();
  }

  @override
  Widget build(BuildContext context) {
    String newTaskTitle = '';
    double bottomEdge=MediaQuery.of(context).viewInsets.bottom;
    double heightFactor=MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(25,10,25,bottomEdge),
        child: SizedBox(
          height: 300,
          // padding: EdgeInsets.symmetric(vertical: 45.0,horizontal: 50.0),
          child: Column(
            children: [
              TextField(
                autofocus: true,
                style: KtextfieldStyle,
                controller: textFieldController,
                onChanged: (value) {
                  newTaskTitle = value;
                },
                onSubmitted: (value) {
                  if (value.isNotEmpty) {
                    newTaskTitle = value;
                    context.read<TaskData>().addTask(newTaskTitle);

                  }
                  Navigator.pop(context);
                  clearText();
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: KgreenColor
                ),
                  onPressed: (){
                  if(newTaskTitle.isNotEmpty){
                    context.read<TaskData>().addTask(newTaskTitle);}
                  Navigator.pop(context);},

                  child: Text('Add Task'))
            ],
          ),)
      ),
    );
  }
}

// if (newTaskTitle.isNotEmpty) {
// context.read<TaskData>().addTask(newTaskTitle);
// }
// FocusScope.of(context).unfocus();
// clearText();






