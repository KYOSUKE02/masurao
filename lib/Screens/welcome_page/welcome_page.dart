import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:masurao/Screens/LoginPage/LoginPage.dart';
import 'package:masurao/UserModel.dart';
import 'package:masurao/Screens/SignUpPage/SignUpPage.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomePage extends StatelessWidget {
  static const String id = 'welcome_page';
  final UserState userState = UserState();
  final pageViewController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFB22222),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                  child: Container(
                width: double.infinity,
                height: 500,
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 50),
                      child: PageView(
                        controller: pageViewController,
                        scrollDirection: Axis.horizontal,
                        children: [
                          Stack(
                            children: [
                              Image.asset(
                                  'images/tianshu-liu-SBK40fdKbAg-unsplash.jpg',
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.cover),
                              Align(
                                alignment: Alignment(0, -1),
                                child: Text(
                                  'MASURAO\nFor Futsal',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Image.asset(
                              'images/totte-annerbrink-7PRi1chCnrs-unsplash.jpg',
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover),
                          Image.asset(
                              'images/totte-annerbrink-7PRi1chCnrs-unsplash.jpg',
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment(0, 1),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: SmoothPageIndicator(
                          controller: pageViewController,
                          count: 3,
                        ),
                      ),
                    )
                  ],
                ),
              )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 130,
                    height: 30,
                    child: OutlinedButton(
                      child: Text(
                        '新規登録',
                        style: TextStyle(
                          color: Colors.white,
                          // backgroundColor: Colors.black.withOpacity(0),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUpPage()),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    width: 130,
                    height: 30,
                    child: OutlinedButton(
                      child: Text(
                        'ログイン',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
