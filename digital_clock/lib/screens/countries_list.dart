import 'dart:async';

import 'package:flutter/material.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart';

class GetCountryListItems extends StatefulWidget {
  @override
  _GetCountryListItemsState createState() => _GetCountryListItemsState();
}

class _GetCountryListItemsState extends State<GetCountryListItems> {
  TimeOfDay _timeOfDay = TimeOfDay.now();
  Timer timer;
  DateTime now;
  String americaTime;
  String asiaTime;
  String uKTime;
  String losAngelesTime;
  String dubaiTime;

  @override
  void initState() {
    tz.initializeTimeZones();
    timer = new Timer.periodic(
        const Duration(seconds: 1), convertLocalTimeToForeignTime);
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: countryTimeZones(),
      ),
    );
  }

  countryTimeZones() {
    return Column(
      children: [
        ListTile(
          title: Text('New York', style: TextStyle(color: Colors.white60)),
          subtitle:
              Text('9hr 30m behind', style: TextStyle(color: Colors.white60)),
          trailing: Text(
            americaTime,
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
        ),
        Divider(),
        ListTile(
          title: Text('Tokyo', style: TextStyle(color: Colors.white60)),
          subtitle:
              Text('3hr 30m ahead', style: TextStyle(color: Colors.white60)),
          trailing: Text(
            asiaTime,
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
        ),
        Divider(),
        ListTile(
          title: Text('London', style: TextStyle(color: Colors.white60)),
          subtitle:
              Text('5hr 30m behind', style: TextStyle(color: Colors.white60)),
          trailing: Text(
            uKTime,
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
        ),
        Divider(),
        ListTile(
          title: Text('Los Angeles', style: TextStyle(color: Colors.white60)),
          subtitle:
              Text('13hr 30m behind', style: TextStyle(color: Colors.white60)),
          trailing: Text(
            losAngelesTime,
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
        ),
        Divider(),
        ListTile(
          title: Text('Dubai', style: TextStyle(color: Colors.white60)),
          subtitle:
              Text('1hr 30m behind', style: TextStyle(color: Colors.white60)),
          trailing: Text(
            dubaiTime,
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
        ),
      ],
    );
  }

  convertLocalTimeToForeignTime(Timer timer) {
    var now = new DateTime.now();
    var detroitTime = new TZDateTime.from(now, getLocation('America/Detroit'));
    setState(() {
      americaTime =
          '${detroitTime.hour}:${detroitTime.minute.toString().padLeft(2, '0')}';
    });
    // print('America Time - $americaTime');
    var tokyoTime = new TZDateTime.from(now, getLocation('Asia/Tokyo'));
    setState(() {
      asiaTime =
          '${tokyoTime.hour}:${tokyoTime.minute.toString().padLeft(2, '0')}';
    });
    var londonTime = new TZDateTime.from(now, getLocation('Europe/London'));
    setState(() {
      uKTime =
          '${londonTime.hour}:${londonTime.minute.toString().padLeft(2, '0')}';
    });
    var laTime = new TZDateTime.from(now, getLocation('America/Los_Angeles'));
    setState(() {
      losAngelesTime =
          '${laTime.hour}:${laTime.minute.toString().padLeft(2, '0')}';
    });
    var uaeTime = new TZDateTime.from(now, getLocation('Asia/Dubai'));
    setState(() {
      dubaiTime =
          '${uaeTime.hour}:${uaeTime.minute.toString().padLeft(2, '0')}';
    });
    // print('Tokyo Time - $asiaTime');
  }
}
