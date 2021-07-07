import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:masurao/Screens/LoginPage/LoginPage.dart';
import 'package:masurao/UserModel.dart';
import 'package:masurao/Screens/SignUpPage/SignUpPage.dart';
import 'package:masurao/res/theme.dart';
import 'package:masurao/res/widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_sliding_tutorial/flutter_sliding_tutorial.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomePage extends StatelessWidget {
  static const String id = 'welcome_page';
  final UserState userState = UserState();
  final pageViewController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: BackgroundColor,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                  child: Container(
                width: double.infinity,
                height: 600,
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
                              image(
                                  'images/tianshu-liu-SBK40fdKbAg-unsplash.jpg'),
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
                          image(
                              'images/totte-annerbrink-7PRi1chCnrs-unsplash.jpg'),
                          image(
                              'images/totte-annerbrink-7PRi1chCnrs-unsplash.jpg'),
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
              Container(
                padding: EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Login_button('ログイン'), Register_button('新規登録')],
                ),
              ),
            ],
          ),
        ));
  }
}
