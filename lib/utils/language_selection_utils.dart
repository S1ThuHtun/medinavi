import 'package:flutter/material.dart';

void languageSelection(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Choose the language'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text('English'),
              onTap: () {
                Navigator.pop(context);
                _showSnackbar(context, 'English is selected');
              },
            ),
            ListTile(
              title: Text('日本語'),
              onTap: () {
                Navigator.pop(context);
                _showSnackbar(context, '日本語が選択されています');
              },
            ),
            ListTile(
              title: Text('中文'),
              onTap: () {
                Navigator.pop(context);
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
