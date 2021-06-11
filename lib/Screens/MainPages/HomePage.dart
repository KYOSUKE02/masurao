import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event.dart';

import 'MatchMakePage/MatchMake.dart';

class HomePage extends StatefulWidget {
  static const String id = 'home_page';
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  //カレンダー機能
  DateTime _currentDate = DateTime.now();

  void onDayPressed(DateTime date, List<Event> events) {
    this.setState(() => _currentDate = date);
    Fluttertoast.showToast(msg: date.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(8),
            child: CalendarCarousel<Event>(
                onDayPressed: onDayPressed,
                weekendTextStyle: TextStyle(color: Colors.red),
                thisMonthDayBorderColor: Colors.grey,
                weekFormat: false,
                height: 450.0,
                selectedDateTime: _currentDate,
                daysHaveCircularBorder: false,
                customGridViewPhysics: NeverScrollableScrollPhysics(),
                markedDateShowIcon: true,
                markedDateIconMaxShown: 2,
                todayTextStyle: TextStyle(
                  color: Colors.blue,
                ),
                markedDateIconBuilder: (event) {
                  return event.icon;
                },
                todayBorderColor: Colors.green,
                markedDateMoreShowTotal: false),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          // 投稿画面に遷移
          await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return MatchPage();
            }),
          );
        },
      ),
    );
  }
}
