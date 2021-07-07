import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../../UserModel.dart';

class MatchPage extends StatefulWidget {
  @override
  _MatchPageState createState() => _MatchPageState();
}

class _MatchPageState extends State<MatchPage> {
  String teamName = '';
  GeoPoint match_location;
  Timestamp start_time;
  Timestamp end_time;
  int cost;
  bool _pinned = false;
  bool _snap = false;
  bool _floating = false;

  List<DocumentSnapshot> documentList = [];

  @override
  Widget build(BuildContext context) {
    final UserState userState = Provider.of<UserState>(context);
    final User user = userState.user;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
              enableDrag: true,
              context: context,
              builder: (context) {
                return SingleChildScrollView(
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.all(32),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextFormField(
                            decoration: InputDecoration(labelText: '開始時間'),
                            keyboardType: TextInputType.multiline,
                            maxLines: 1,
                            onChanged: (String value) {
                              setState(() {
                                teamName = value;
                              });
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(labelText: '終了時間'),
                            keyboardType: TextInputType.multiline,
                            maxLines: 1,
                            onChanged: (String value) {
                              setState(() {
                                teamName = value;
                              });
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(labelText: '場所'),
                            keyboardType: TextInputType.multiline,
                            maxLines: 1,
                            onChanged: (String value) {
                              setState(() {
                                teamName = value;
                              });
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(labelText: '試合カテゴリ'),
                            keyboardType: TextInputType.multiline,
                            maxLines: 1,
                            onChanged: (String value) {
                              setState(() {
                                teamName = value;
                              });
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(labelText: 'レベル'),
                            keyboardType: TextInputType.multiline,
                            maxLines: 1,
                            onChanged: (String value) {
                              setState(() {
                                teamName = value;
                              });
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(labelText: '諸費用'),
                            keyboardType: TextInputType.multiline,
                            maxLines: 1,
                            onChanged: (String value) {
                              setState(() {
                                teamName = value;
                              });
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(labelText: '備考'),
                            keyboardType: TextInputType.multiline,
                            maxLines: 1,
                            onChanged: (String value) {
                              setState(() {
                                teamName = value;
                              });
                            },
                          ),
                          const SizedBox(height: 8),
                          Container(
                            width: double.infinity,
                            child: ElevatedButton(
                              child: Text('投稿'),
                              onPressed: () async {
                                final date =
                                    DateTime.now().toLocal().toIso8601String();
                                final email = user.email;
                                await FirebaseFirestore.instance
                                    .collection('matches')
                                    .doc('')
                                    .set({
                                  'team_name': email,
                                  'match_location': match_location,
                                  'start_time': start_time,
                                  'end_time': end_time,
                                  'cost': cost
                                });
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              });
        },
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: _pinned,
            snap: _snap,
            floating: _floating,
            expandedHeight: 120.0,
            flexibleSpace: const FlexibleSpaceBar(
              title: Text('Make Match'),
              background: FlutterLogo(),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
              child: Center(
                child: Text('Scroll to see the sliverappbar'),
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                color: index.isOdd ? Colors.white : Colors.black12,
                height: 100,
                child: Center(
                  child: Text('$index', textScaleFactor: 5),
                ),
              );
            },
            childCount: 20,
          ))
        ],
        // children: [
        //   Container(
        //
        //   // ignore: deprecated_member_use
        //   FlatButton(
        //       onPressed: () async {
        //         await FirebaseFirestore.instance
        //             .collection('users')
        //             .doc('id_abc')
        //             .collection('orders')
        //             .doc('id_123')
        //             .set({'price': 600, 'date': '9:00'});
        //       },
        //       child: Text("ose")),
        //   FlatButton(
        //       onPressed: () async {
        //         final snapshot =
        //             await FirebaseFirestore.instance.collection('users').get();
        //         setState(() {
        //           documentList = snapshot.docs;
        //         });
        //       },
        //       child: Text("sue")),
        //   Column(
        //     children: documentList.map((document) {
        //       return ListTile(
        //         title: Text('${document['name']}さん'),
        //         subtitle: Text('${document['age']}歳'),
        //       );
        //     }).toList(),
        //   ),
        // ],
      ),
    );
  }
}
