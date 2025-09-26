// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get selectLanguage => 'Select Language';

  @override
  String get getStarted => 'Get Started';

  @override
  String get chooseLanguage => 'Choose the Language';

  @override
  String get selectedLanguage => 'English is selected';

  @override
  String get login => 'Login';

  @override
  String loginAs(Object email) {
    return 'Logged in as $email';
  }

  @override
  String signedUpAs(Object email) {
    return 'Singed up as $email';
  }

  @override
  String get enterEmail => 'Please enter your email';

  @override
  String get invalidEmail => 'Invalid email format';

  @override
  String get enteredPasswordMessage => 'Enter Password';

  @override
  String get enteredPasswordErrorMessage =>
      'Password must have at least 6 characters';

  @override
  String get confirmPasswordMessage => 'Confirm Password';

  @override
  String get confirmPasswordErrorMessage =>
      'Password and Confirm Password are not matched';

  @override
  String get logOut => 'LogOut';

  @override
  String get signUp => 'SignUp';

  @override
  String get newSignUp => 'Don\'t have an account? SignUp';

  @override
  String get oldLogin => 'Already have an account! Login';

  @override
  String get emailAddress => 'Email Address';

  @override
  String get password => 'Password';

  @override
  String get confirmPassword => 'Confirm Password';

  @override
  String get settings => 'Settings';
}
