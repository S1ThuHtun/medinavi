// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get selectLanguage => '选择语言';

  @override
  String get getStarted => '开始使用';

  @override
  String get chooseLanguage => '请选择语言';

  @override
  String get selectedLanguage => '已选择中文';

  @override
  String get login => '登录';

  @override
  String loginAs(Object email) {
    return '已登录为 $email';
  }

  @override
  String signedUpAs(Object email) {
    return '已注册为 $email';
  }

  @override
  String get enterEmail => '请输入电子邮件地址';

  @override
  String get invalidEmail => '电子邮件格式无效';

  @override
  String get enteredPasswordMessage => '请输入密码';

  @override
  String get enteredPasswordErrorMessage => '密码至少需要6个字符';

  @override
  String get confirmPasswordMessage => '请确认密码';

  @override
  String get confirmPasswordErrorMessage => '密码与确认密码不一致';

  @override
  String get logOut => '登出';

  @override
  String get signUp => '注册新账户';

  @override
  String get newSignUp => '还没有账户？注册新账户';

  @override
  String get oldLogin => '已有账户？请登录';

  @override
  String get emailAddress => '电子邮件地址';

  @override
  String get password => '密码';

  @override
  String get confirmPassword => '确认密码';

  @override
  String get settings => '设置';
}
