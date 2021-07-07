import 'package:flutter/material.dart';
import 'package:masurao/Screens/LoginPage/LoginPage.dart';
import 'package:masurao/Screens/SignUpPage/SignUpPage.dart';

class Login_button extends StatelessWidget {
  final String show_message;
  const Login_button(this.show_message);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      height: 40,
      child: RaisedButton(
        color: Colors.red,
        child: Text(
          show_message,
          style: TextStyle(
            fontSize: 15,
            color: Colors.white,
            // backgroundColor: Colors.black.withOpacity(0),
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
        },
      ),
    );
  }
}

class Register_button extends StatelessWidget {
  final String show_message;
  const Register_button(this.show_message);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      height: 40,
      child: RaisedButton(
        color: Colors.red,
        child: Text(
          show_message,
          style: TextStyle(
            fontSize: 15,
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
    );
  }
}

class image extends StatelessWidget {
  final String asset;
  const image(this.asset);
  @override
  Widget build(BuildContext context) {
    return Image.asset(asset,
        width: double.infinity, height: double.infinity, fit: BoxFit.cover);
  }
}
