import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:intl/date_symbol_data_local.dart';
import 'package:table_calendar/table_calendar.dart';

import 'MatchMakePage/MatchMake.dart';

class HomePage extends StatefulWidget {
  static const String id = 'home_page';
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay;
  Map<DateTime, List> _eventsList = {};

  int getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    //サンプルのイベントリスト
    _eventsList = {
      DateTime.now().subtract(Duration(days: 2)): ['Event A6', 'Event B6'],
      DateTime.now(): ['Event A7', 'Event B7', 'Event C7', 'Event D7'],
      DateTime.now().add(Duration(days: 1)): [
        'Event A8',
        'Event B8',
        'Event C8',
        'Event D8'
      ],
      DateTime.now().add(Duration(days: 3)):
          Set.from(['Event A9', 'Event A9', 'Event B9']).toList(),
      DateTime.now().add(Duration(days: 7)): [
        'Event A10',
        'Event B10',
        'Event C10'
      ],
      DateTime.now().add(Duration(days: 11)): ['Event A11', 'Event B11'],
      DateTime.now().add(Duration(days: 17)): [
        'Event A12',
        'Event B12',
        'Event C12',
        'Event D12'
      ],
      DateTime.now().add(Duration(days: 22)): ['Event A13', 'Event B13'],
      DateTime.now().add(Duration(days: 26)): [
        'Event A14',
        'Event B14',
        'Event C14'
      ],
    };
  }

  @override
  Widget build(BuildContext context) {
    final _events = LinkedHashMap<DateTime, List>(
      equals: isSameDay,
      hashCode: getHashCode,
    )..addAll(_eventsList);

    List getEventForDay(DateTime day) {
      return _events[day] ?? [];
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('calendar sample'),
      ),
      body: Column(
        children: [
          TableCalendar(
            //locale: 'ja_JP',
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: _focusedDay,
            eventLoader: getEventForDay, //追記
            calendarFormat: _calendarFormat,
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              if (!isSameDay(_selectedDay, selectedDay)) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              }
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
          ),
        ],
      ),
    );
  }
}

// class _HomePageState extends State<HomePage> {
//   CalendarFormat _calendarFormat = CalendarFormat.month;
//   DateTime _focusedDay = DateTime.now();
//   DateTime _selectedDay;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('TableCalendar - Basics'),
//       ),
//       body: TableCalendar(
//         focusedDay: _focusedDay,
//         calendarFormat: _calendarFormat,
//         selectedDayPredicate: (day) {
//           // Use `selectedDayPredicate` to determine which day is currently selected.
//           // If this returns true, then `day` will be marked as selected.
//
//           // Using `isSameDay` is recommended to disregard
//           // the time-part of compared DateTime objects.
//           return isSameDay(_selectedDay, day);
//         },
//         onDaySelected: (selectedDay, focusedDay) {
//           if (!isSameDay(_selectedDay, selectedDay)) {
//             // Call `setState()` when updating the selected day
//             setState(() {
//               _selectedDay = selectedDay;
//               _focusedDay = focusedDay;
//             });
//           }
//         },
//         onFormatChanged: (format) {
//           if (_calendarFormat != format) {
//             // Call `setState()` when updating calendar format
//             setState(() {
//               _calendarFormat = format;
//             });
//           }
//         },
//         onPageChanged: (focusedDay) {
//           // No need to call `setState()` here
//           _focusedDay = focusedDay;
//         },
//       ),
//     );
//   }
// //カレンダー機能
// DateTime _currentDate = DateTime.now();
//
// void onDayPressed(DateTime date, List<Event> events) {
//   this.setState(() => _currentDate = date);
//   Fluttertoast.showToast(msg: date.toString());
// }
//
// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(),
//     body: Column(
//       children: [
//         Container(
//           margin: EdgeInsets.all(8),
//           child: CalendarCarousel<Event>(
//               onDayPressed: onDayPressed,
//               weekendTextStyle: TextStyle(color: Colors.red),
//               thisMonthDayBorderColor: Colors.grey,
//               weekFormat: false,
//               height: 450.0,
//               selectedDateTime: _currentDate,
//               daysHaveCircularBorder: false,
//               customGridViewPhysics: NeverScrollableScrollPhysics(),
//               markedDateShowIcon: true,
//               markedDateIconMaxShown: 2,
//               todayTextStyle: TextStyle(
//                 color: Colors.blue,
//               ),
//               markedDateIconBuilder: (event) {
//                 return event.icon;
//               },
//               todayBorderColor: Colors.green,
//               markedDateMoreShowTotal: false),
//         ),
//       ],
//     ),
//   );
// }
