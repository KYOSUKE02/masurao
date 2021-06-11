import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:masurao/UserModel.dart';
import 'package:masurao/Screens/MainPages/page_controller.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  static const String id = 'login_page';
  final _auth = FirebaseAuth.instance;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    final UserState userState = Provider.of<UserState>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('ユーザー登録・ログイン'),
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(24),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'メールアドレス',
                ),
                onChanged: (value) {
                  email = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'パスワード',
                ),
                obscureText: true,
                onChanged: (String value) {
                  password = value;
                },
              ),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  child: Text('ログイン'),
                  onPressed: () async {
                    try {
                      final result = await _auth.signInWithEmailAndPassword(
                          email: email, password: password);
                      userState.setUser(result.user);
                      await Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) {
                        return PageTab();
                      }));
                    } catch (e) {
                      print(e);
                    }
                  },
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PageTab()),
                    );
                  },
                  child: Text('idou'))
            ]),
          ),
        ));
  }
}
