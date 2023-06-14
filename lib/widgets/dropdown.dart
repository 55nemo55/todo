import 'package:flutter/material.dart';
import 'package:my_own_todo/constants.dart';
import 'package:my_own_todo/constants.dart';

class DropdownWidget extends StatefulWidget {
  final Color dropdownColor;
  const DropdownWidget({super.key, required this.dropdownColor});

  @override
  State<DropdownWidget> createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  String dropdownValue = 'Ethnics';




  @override
  Widget build(BuildContext context) {

    return DropdownButton(
        dropdownColor: Color(0xfffcf7f2),
        underline: Container(),
        style: TextStyle(color: widget.dropdownColor),
        value: dropdownValue,
        iconEnabledColor: widget.dropdownColor,
        items: <String>['Ethnics', 'Personal', 'Work']
            .map(
              (value) => DropdownMenuItem(
                value: value,
                child: Text(
                  value,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            )
            .toList(),
        onChanged: (newValue) {
          setState(() {
            dropdownValue = newValue!;
          });
        });
  }
}
