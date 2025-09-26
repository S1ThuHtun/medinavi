import 'package:flutter/material.dart';
import 'package:medinavi/l10n/app_localizations.dart';
import 'package:medinavi/main.dart';

void languageSelection(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(AppLocalizations.of(context)!.chooseLanguage),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text('English'),
              onTap: () {
                Navigator.pop(context);
                MyApp.setLocale(context, const Locale('en'));
                _showSnackbar(context, 'English is selected');
              },
            ),
            ListTile(
              title: Text('日本語'),
              onTap: () {
                Navigator.pop(context);
                MyApp.setLocale(context, const Locale('ja'));
                _showSnackbar(context, '日本語が選択されています');
              },
            ),
            ListTile(
              title: Text('中文'),
              onTap: () {
                Navigator.pop(context);
                MyApp.setLocale(context, const Locale('zh'));
                _showSnackbar(context, '已选择中文');
              },
            ),
          ],
        ),
      );
    },
  );
}

void _showSnackbar(context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Center(child: Text(message)),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(15),
      ),
    ),
  );
}
