import 'dart:async';

import 'package:flutter/material.dart';

class GetCurrentTime extends StatefulWidget {
  @override
  _GetCurrentTimeState createState() => _GetCurrentTimeState();
}

class _GetCurrentTimeState extends State<GetCurrentTime> {
  TimeOfDay _timeOfDay = TimeOfDay.now();
  Timer timer;
  DateTime dateTime;

  @override
  void initState() {
    dateTime = new DateTime.now();
    timer = new Timer.periodic(const Duration(seconds: 1), setTime);
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')}',
          style: TextStyle(fontSize: 64, color: Colors.blueAccent),
        ),
        SizedBox(
          width: 5,
        ),
      ],
    );
  }

  setTime(Timer timer) {
    setState(() {
      dateTime = new DateTime.now();
    });
  }
}
