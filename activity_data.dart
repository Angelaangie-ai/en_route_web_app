import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'activity.dart';
import 'dart:collection';

class ActivityData extends ChangeNotifier {
  List<TimeandPrice> _name = [
    TimeandPrice(name: "Going to Work"),
    TimeandPrice(name: "Bringing to school"),
    TimeandPrice(name: "Going on hockey")
  ];

  List<TimeandPrice> _startHours = [
    TimeandPrice(hour1: '16:00'),
    TimeandPrice(hour1: '16:00' ),
    TimeandPrice(hour1: '18:30')
  ];
  List<TimeandPrice> _endHours = [
    TimeandPrice(hour2: '16:00' ),
    TimeandPrice(hour2: '16:00'),
    TimeandPrice(hour2:'14:50')
  ];
  List<TimeandPrice> _tripPrice = [
    TimeandPrice(price: "15"),
    TimeandPrice(price: "16"),
    TimeandPrice(price: "13")
  ];

  UnmodifiableListView<TimeandPrice> get startHours {
    return UnmodifiableListView(_startHours);
  }
  UnmodifiableListView<TimeandPrice> get endHours {
    return UnmodifiableListView(_endHours);
  }
  UnmodifiableListView<TimeandPrice> get tripPrice {
    return UnmodifiableListView(_tripPrice);
  }
  UnmodifiableListView<TimeandPrice> get name {
    return UnmodifiableListView(_name);
  }


  void addData(String newActivityPrice, String newActivityName) {


    notifyListeners();
  }
  int get taskCount {
    return _name.length;
  }
  int get taskCount1 {
    return _tripPrice.length;
  }
  int get taskCount2 {
    return _endHours.length;
  }
  int get taskCount3 {
    return _startHours.length;
  }
  void addActivity(String newActivityStartHour, String newActivityName, String newActivityEndHour, String newPriceTitle) {
    final starthour = TimeandPrice(hour1: newActivityStartHour);
    final endhour = TimeandPrice(hour2: newActivityEndHour);
    final name = TimeandPrice(name: newActivityName);
    final tripprice = TimeandPrice(price: newPriceTitle);
    _startHours.add(starthour);
    _endHours.add(endhour);
    _tripPrice.add(tripprice);
    _name.add(name);
    notifyListeners();
  }
}





