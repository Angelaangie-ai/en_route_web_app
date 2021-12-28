import 'package:flutter/material.dart';
import 'task_notscreen.dart';
import 'taskdetail_notscreen.dart';
import 'widget_notscreen.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;


  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _tasks = <Task>[];
  final _starTime = <Task>[];
  final _endTime = <Task>[];

  @override
  void initState() {
    super.initState();
    _tasks.add(Task('Buy something at the market','12.00','13.00', true));
  }

  void _addTask(String text) {
    _tasks.add(Task(text,text,text,false));
    Navigator.pop(context);
  }

  void _openAddTaskPage() {
    Navigator.push(context,
      MaterialPageRoute(builder: (context) => AddTaskPage(title: 'Add a New Activity', onClick: _addTask)),
    );
  }

  Function _onClick(Task task) {
    return () {
      setState(() {
        task.isCompleted = !task.isCompleted;
      });
    };
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text(widget.title),
      ),
      body: TaskList(_tasks,_starTime,_endTime,_onClick),
      floatingActionButton: new FloatingActionButton(
        backgroundColor: Color(0xFF06630b),
        onPressed: _openAddTaskPage,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
    );
  }
}