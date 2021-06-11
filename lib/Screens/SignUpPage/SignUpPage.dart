import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'SignUp_model.dart';

class SignUpPage extends StatefulWidget {
  static const String id = 'signup_page';

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _auth = FirebaseAuth.instance;

  String infoText = '';

  String email = '';

  String password = '';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ChangeNotifierProvider<SignUpModel>(
      create: (context) => SignUpModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('ユーザー登録・ログイン'),
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'メールアドレス'),
                  onChanged: (String value) {},
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'パスワード'),
                  obscureText: true,
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  child: Text(infoText),
                ),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text('ユーザ登録'),
                    onPressed: () async {
                      try {
                        final FirebaseAuth auth = FirebaseAuth.instance;
                        final result =
                            await auth.createUserWithEmailAndPassword(
                                email: email, password: password);
                        await Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) {
                            // return PageTab(result.user);
                          }),
                        );
                      } catch (e) {
                        infoText = "登録に失敗しました:${e.toString()}";
                      }
                    },
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
