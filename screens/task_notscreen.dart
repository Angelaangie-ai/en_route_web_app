import 'package:flutter/material.dart';

class Task {
  Task(this.text1,this.text2, this.text3, this.isCompleted);
  final String text1;
  final String text2;
  final String text3;
  bool isCompleted;
}

class TaskItem extends StatelessWidget {
  TaskItem(this._task,this._startime, this._endtime, this._onClick);

  final Task _task;
  final Task _startime;
  final Task _endtime;
  final Function _onClick;
  final TextStyle _taskTextStyle = TextStyle(fontWeight: FontWeight.w300, fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(_task.text1,style: _taskTextStyle),
        subtitle: Text(_endtime.text3),
        trailing: Text(_startime.text2),
        onTap: _onClick(_task),
        );
  }
}
