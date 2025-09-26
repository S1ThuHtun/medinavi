// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get selectLanguage => '言語選択';

  @override
  String get getStarted => '開始';

  @override
  String get chooseLanguage => '言語を選択してください';

  @override
  String get selectedLanguage => '日本語が選択されています';

  @override
  String get login => 'ログイン';

  @override
  String loginAs(Object email) {
    return '$emailでログインしています';
  }

  @override
  String signedUpAs(Object email) {
    return '$emailで登録しました';
  }

  @override
  String get enterEmail => 'メールアドレスを入力してください';

  @override
  String get invalidEmail => 'メールアドレスの形式が正しくありません';

  @override
  String get enteredPasswordMessage => 'パスワードを入力してください';

  @override
  String get enteredPasswordErrorMessage => 'パスワードは6文字以上で入力してください';

  @override
  String get confirmPasswordMessage => 'パスワード（確認）を入力してください';

  @override
  String get confirmPasswordErrorMessage => 'パスワードと確認用パスワードが一致しません';

  @override
  String get logOut => 'ログアウト';

  @override
  String get signUp => '新登録';

  @override
  String get newSignUp => 'アカウントをお持ちでないですか？新規登録';

  @override
  String get oldLogin => 'アカウントはお持ちですか？ログイン';

  @override
  String get emailAddress => 'メールアドレス';

  @override
  String get password => 'パスワード';

  @override
  String get confirmPassword => 'パスワード（確認）';

  @override
  String get settings => '設定';
}
