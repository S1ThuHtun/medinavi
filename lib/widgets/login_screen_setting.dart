import 'package:flutter/material.dart';
import 'package:medinavi/l10n/app_localizations.dart';
import 'package:medinavi/utils/language_selection_utils.dart';

class LoginScreenSetting extends StatelessWidget {
  const LoginScreenSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 110,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Icon(Icons.settings, color: Colors.white, size: 35),
                SizedBox(width: 10),
                Text(
                  AppLocalizations.of(context)!.settings,
                  style: TextStyle(color: Colors.white, fontSize: 28),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.language, color: Colors.blue),
            title: Text(AppLocalizations.of(context)!.selectLanguage),
            onTap: () {
              Navigator.pop(context);
              languageSelection(
                context,
              ); // Utility function is written in language_selection_utils.dart
            },
          ),
          ListTile(
            leading: Icon(Icons.info, color: Colors.indigo),
            title: Text('About'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
