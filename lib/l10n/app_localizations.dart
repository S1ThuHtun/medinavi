import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ja'),
    Locale('zh'),
  ];

  /// Asking the user what Language would they like to start the app with
  ///
  /// In en, this message translates to:
  /// **'Select Language'**
  String get selectLanguage;

  /// The text to go to the SignUp and Login screen
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStarted;

  /// Shows the title of the language selection box when the language selection is pressed
  ///
  /// In en, this message translates to:
  /// **'Choose the Language'**
  String get chooseLanguage;

  /// Shows what language is selected in the messagebox
  ///
  /// In en, this message translates to:
  /// **'English is selected'**
  String get selectedLanguage;

  /// Text for Login
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// After logged the snackbar will show logged in as email
  ///
  /// In en, this message translates to:
  /// **'Logged in as {email}'**
  String loginAs(Object email);

  /// After signed up the snackbar will show signed up as email
  ///
  /// In en, this message translates to:
  /// **'Singed up as {email}'**
  String signedUpAs(Object email);

  /// When user is not filling email, this message will be shown
  ///
  /// In en, this message translates to:
  /// **'Please enter your email'**
  String get enterEmail;

  /// When user input invalid method, this message will show
  ///
  /// In en, this message translates to:
  /// **'Invalid email format'**
  String get invalidEmail;

  /// No description provided for @enteredPasswordMessage.
  ///
  /// In en, this message translates to:
  /// **'Enter Password'**
  String get enteredPasswordMessage;

  /// No description provided for @enteredPasswordErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'Password must have at least 6 characters'**
  String get enteredPasswordErrorMessage;

  /// Ask user to confirm the password
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPasswordMessage;

  /// When the password and confirmPassword are not matched, this message will be shown
  ///
  /// In en, this message translates to:
  /// **'Password and Confirm Password are not matched'**
  String get confirmPasswordErrorMessage;

  /// Text for Logout
  ///
  /// In en, this message translates to:
  /// **'LogOut'**
  String get logOut;

  /// Text for SignUp
  ///
  /// In en, this message translates to:
  /// **'SignUp'**
  String get signUp;

  /// Text for SignUp new users
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account? SignUp'**
  String get newSignUp;

  /// Text for old users to login
  ///
  /// In en, this message translates to:
  /// **'Already have an account! Login'**
  String get oldLogin;

  /// Input for email address
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
  String get emailAddress;

  /// Adding password for the mail
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// Adding the same password for confirmation
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// Title of the endDrawer from the appbar in Login screen
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ja', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ja':
      return AppLocalizationsJa();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
