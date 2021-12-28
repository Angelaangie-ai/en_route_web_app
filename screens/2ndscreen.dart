import 'package:enroute/components/reusable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'add_activity_screen.dart';
import 'package:enroute/components/activity_list.dart';
import 'combination_screen.dart';

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Make your daily combination",
        style: TextStyle(
          fontFamily: 'Bryndan',
        ),
        ),
      ),
      body: Center(child:
      Container(
        child: ActivityList(),
      ),
      ),
    floatingActionButton: FloatingActionButton.extended(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddActivityScreen()),
        );
      },
      label: Text("Add a new daily activity",
      style: TextStyle(
        fontFamily: "Pacifico"
      ),),
    icon: Icon(Icons.add),
    backgroundColor: Colors.green,
    ),
    );
  }
}

