import 'package:flutter/material.dart';
import 'package:medinavi/l10n/app_localizations.dart';
import 'package:medinavi/screens/sign_up_screen.dart';
import 'package:medinavi/utils/language_selection_utils.dart';

class StartupScreen extends StatelessWidget {
  const StartupScreen({super.key});

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
                        AppLocalizations.of(context)!.selectLanguage,
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
                        AppLocalizations.of(context)!.getStarted,
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
