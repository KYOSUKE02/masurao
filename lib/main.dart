import 'package:flutter/material.dart';
import 'package:masurao/Screens/MainPages/HomePage.dart';
import 'package:masurao/Screens/LoginPage/LoginPage.dart';
import 'package:masurao/Screens/MainPages/TalkPage.dart';
import 'package:masurao/UserModel.dart';
import 'package:masurao/Screens/SignUpPage/SignUpPage.dart';
import 'package:masurao/Screens/welcome_page/welcome_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MasuraoApp());
}

class MasuraoApp extends StatelessWidget {
  final UserState userState = UserState();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserState>(
        create: (context) => UserState(),
        child: MaterialApp(
            theme: ThemeData(
              primarySwatch: Colors.red,
            ),
            initialRoute: WelcomePage.id,
            routes: {
              WelcomePage.id: (context) => WelcomePage(),
              LoginPage.id: (context) => LoginPage(),
              SignUpPage.id: (context) => SignUpPage(),
              HomePage.id: (context) => HomePage(),
              TalkPage.id: (context) => TalkPage(),
            }));
  }
}
