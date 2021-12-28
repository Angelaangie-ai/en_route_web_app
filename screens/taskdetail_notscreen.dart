import 'package:flutter/material.dart';

import 'task_notscreen.dart';

class TaskList extends StatelessWidget {
  TaskList(this._tasks, this._starTime, this._endTime, this._onClick);

  final List<Task> _tasks;
  final List<Task> _starTime;
  final List<Task> _endTime;
  final _onClick;


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _tasks.length,
        itemBuilder: (context,index)
        {
          var task = _tasks[index];
          var startime = _starTime[index];
          var endtime = _endTime[index];
          return TaskItem(task,startime,endtime,_onClick);
        }
        );

  }
}