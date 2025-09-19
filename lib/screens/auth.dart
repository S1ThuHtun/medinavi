import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(
                top: 30,
                bottom: 20,
                right: 20,
                left: 20,
              ),
              width: 200,
              child: Text(
                'Hello',
              ), //Image.asset('assets/images/chat.png'),
            ),
          ],
        ),
      ),
    );
  }
}
