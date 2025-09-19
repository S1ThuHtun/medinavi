import 'package:flutter/material.dart';
import 'package:medinavi/screens/auth.dart';

class StartupScreen extends StatelessWidget {
  const StartupScreen({super.key});

  // Navigation function for the second button (login/register)
  void _navigateToLogin(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AuthScreen()),
    );
  }

  void _navigateToAuth(ctx) {
    Navigator.push(
      ctx,
      MaterialPageRoute(builder: (context) => AuthScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 200,
                    margin: EdgeInsets.only(
                      top: 50,
                      bottom: 30,
                      right: 20,
                      left: 20,
                    ),
                    child: Image.asset('assets/images/MediNaviLogo.png'),
                  ),
                ],
              ),
            ),

            Container(
              height: 350,
              margin: EdgeInsets.only(bottom: 10, left: 20, right: 20),
              child: Column(
                children: [
                  SizedBox(
                    width: 220,
                    child: Text('利用規約。プライバシーポリシーを回答する前にご確認ください。'),
                  ),
                  SizedBox(height: 60),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () => _navigateToAuth(context),
                      child: Text('同意してさぅそくはじめ'),
                    ),
                  ),
                  SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () => _navigateToLogin(context),
                      child: Text('ログイン .  会員登録'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
