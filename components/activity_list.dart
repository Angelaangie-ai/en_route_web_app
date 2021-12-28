import 'package:flutter/material.dart';
import 'activity_data.dart';
import 'activity_tile.dart';
import 'package:provider/provider.dart';

class ActivityList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ActivityData>(
      builder: (context, activityData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return ActivityTile(
              activityName: activityData.name[index].name,
              activityStartTime: activityData.startHours[index].hour1,
              activityEndTime: activityData.endHours[index].hour2,
              activityMaxPrice: activityData.tripPrice[index].price,
            );
          },
          itemCount: activityData.taskCount,
        );
      },
    );
  }
}
