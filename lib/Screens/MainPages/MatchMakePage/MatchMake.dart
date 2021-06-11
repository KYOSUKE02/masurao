import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../../UserModel.dart';

class MatchPage extends StatefulWidget {
  MatchPage();
  @override
  _MatchPageState createState() => _MatchPageState();
}

class _MatchPageState extends State<MatchPage> {
  String teamName = '';
  GeoPoint match_location;
  Timestamp start_time;
  Timestamp end_time;
  int cost;

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
                            decoration: InputDecoration(labelText: 'コスト'),
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
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            child: Text('ログイン情報'),
          ),
          FlatButton(
              onPressed: () async {
                await FirebaseFirestore.instance
                    .collection('users')
                    .doc('id_abc')
                    .set({'name': '鈴木', 'age': 40});
              },
              child: Text("ose"))
          // Expanded(
          //   child: StreamBuilder<QuerySnapshot>(
          //     stream:
          //         FirebaseFirestore.instance.collection('matches').snapshots(),
          //     builder: (context, snapshot) {
          //       if (snapshot.hasData) {
          //         final List<DocumentSnapshot> documents = snapshot.data.docs;
          //         return ListView(
          //             children: documents.map((document) {
          //           return Card(
          //             child: ListTile(
          //               title: Text(document['team_name']),
          //               // subtitle: Text(document['start_time']),
          //             ),
          //           );
          //         }).toList()
          //             // ignore: missing_return
          //
          //             );
          //       }
          //     },
          //   ),
          // )
        ],
      ),
    );
  }
}
