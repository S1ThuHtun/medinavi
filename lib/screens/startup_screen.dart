import 'package:flutter/material.dart';
import 'package:medinavi/screens/sign_up_screen.dart';
import 'package:medinavi/utils/language_selection_utils.dart';
//import 'package:medinavi/screens/auth.dart';

class StartupScreen extends StatelessWidget {
  const StartupScreen({super.key});

  // Navigation function for the second button (login/register)
  // void _navigateToLogin(BuildContext context) {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => AuthScreen()),
  //   );
  // }

  // void _navigateToAuth(ctx) {
  //   Navigator.push(
  //     ctx,
  //     MaterialPageRoute(builder: (context) => AuthScreen()),
  //   );
  // }

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
                    child: Image.asset('assets/images/medinavi.png'),
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
                  SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        languageSelection(context);
                      },
                      child: Text(
                        'Language',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Get Started',
                        style: TextStyle(fontSize: 20),
                      ),
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
