import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:masurao/Screens/MainPages/TalkPage.dart';

class ContactPage extends StatelessWidget {
  final _tabs = <Tab>[
    Tab(
      text: "試合申し込み相手",
    ),
    Tab(
      text: "試合受付相手",
    )
  ];

  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [TabBar(tabs: _tabs)],
          ),
        ),
        body: TabBarView(
          children: [TabPage()],
        ),
      ),
    );
  }
}

//各タブにトーク相手を表示する
class TabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RaisedButton(onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TalkPage()),
            );
          })
        ],
      ),
    );
  }
}
