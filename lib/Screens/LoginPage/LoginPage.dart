import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:masurao/UserModel.dart';
import 'package:masurao/Screens/MainPages/page_controller.dart';
import 'package:provider/provider.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class LoginPage extends StatelessWidget {
  static final googleLogin = GoogleSignIn(scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ]);
  Future<UserCredential> signInWithGoogle() async {
    // 認証フローのトリガー
    final googleUser = await GoogleSignIn(scopes: [
      'email',
    ]).signIn();
    // リクエストから、認証情報を取得
    final googleAuth = await googleUser.authentication;
    // クレデンシャルを新しく作成
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    // サインインしたら、UserCredentialを返す
    return FirebaseAuth.instance.signInWithCredential(credential);
  }

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
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    SignInButton(Buttons.Google, onPressed: () async {
                      try {
                        final userCredential = await signInWithGoogle();
                      } on FirebaseAuthException catch (e) {
                        print('FirebaseAuthException');
                        print('${e.code}');
                      } on Exception catch (e) {
                        print('Exception');
                        print('${e.toString()}');
                      }
                    }),
                    SignInButton(Buttons.Twitter, onPressed: () {}),
                  ],
                ),
              ),
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
