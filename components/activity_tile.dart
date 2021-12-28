import 'package:flutter/material.dart';

class ActivityTile extends StatelessWidget {
  final String activityStartTime;
  final String activityEndTime;
  final String activityMaxPrice;
  final String activityName;

  ActivityTile(
      {this.activityName,this.activityStartTime,
        this.activityEndTime,
        this.activityMaxPrice,});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        activityName,
        style: TextStyle(
          color: Colors.green,
        ),
      ),
      subtitle: Text("Start time: $activityStartTime,End time:$activityEndTime,Maximum Price:$activityMaxPrice"),
    );
  }
}
