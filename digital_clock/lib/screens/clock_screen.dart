import 'package:digital_clock/screens/countries_list.dart';
import 'package:digital_clock/screens/current_time.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ClockScreen extends StatelessWidget {
  static const Color BG_COLOR = Color(0xff404040);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BG_COLOR,
      body: showTime(),
    );
  }

  Widget buildAppBar() {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          'Clock',
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
      ),
    );
  }

  Widget showTime() {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Flexible(flex: 2, child: buildAppBar()),
          Flexible(flex: 2, child: GetCurrentTime()),
          Flexible(
              flex: 1,
              child: Text(getCurrentDay(),
                  style: TextStyle(fontSize: 14, color: Colors.white60))),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Divider(
              color: Colors.grey,
            ),
          ),
          GetCountryListItems(),
        ],
      ),
    );
  }

  String getCurrentDay() {
    var now = new DateTime.now();
    var formatter = new DateFormat.yMMMd();
    String formattedDate = formatter.format(now);
    String day = DateFormat('EEEE').format(DateTime.now());
    return day + ' | ' + formattedDate; // 2016-01-25
  }
}
