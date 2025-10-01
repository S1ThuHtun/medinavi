import 'package:flutter/material.dart';
import 'package:medinavi/l10n/app_localizations.dart';
import 'package:medinavi/widgets/login_screen_setting.dart';
import 'package:medinavi/services/auth_service.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() {
    return _SignUpScreenState();
  }
}

class _SignUpScreenState extends State<SignUpScreen> {
  var _isLogin = true;
  final _formKey = GlobalKey<FormState>();
  final _authService = AuthService();
  var _isLoading = false;

  // Controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  // Login Form Submission
  void _submit() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      final email = _emailController.text;
      final password = _passwordController.text;

      try {
        if (_isLogin) {
          await _authService.signInWithEmailAndPassword(
            email: email,
            password: password,
          );
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(AppLocalizations.of(context)!.loginAs(email)),
                backgroundColor: Colors.green,
              ),
            );
          }
        } else {
          await _authService.signUpWithEmailAndPassword(
            email: email,
            password: password,
          );
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(AppLocalizations.of(context)!.signedUpAs(email)),
                backgroundColor: Colors.green,
              ),
            );
          }
        }

        // Clear Fields
        _emailController.clear();
        _passwordController.clear();
        _confirmController.clear();
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(e.toString()),
              backgroundColor: Colors.red,
            ),
          );
        }
      } finally {
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
        }
      }
    }
  }

  void _toggleForm() {
    setState(() {
      _isLogin = !_isLogin;
    });

    // Clear Previous Input when Toggeling
    _emailController.clear();
    _passwordController.clear();
    _confirmController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // This removes the back button
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Image.asset(
          'assets/images/medinavi.png',
          width: 70,
          height: 70,
          color: Colors.white,
        ),
        actions: [
          Builder(
            builder: (context) {
              return IconButton(
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
                icon: Icon(Icons.menu, color: Colors.white),
              );
            },
          ),
        ],
      ),
      // Add the endDrawer here
      endDrawer: LoginScreenSetting(),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _isLogin
                  ? AppLocalizations.of(context)!.login
                  : AppLocalizations.of(context)!.signUp,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
            ),
            SizedBox(height: 5),

            Card(
              margin: EdgeInsets.all(20),
              child: SingleChildScrollView(
                padding: EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: AppLocalizations.of(
                            context,
                          )!.emailAddress,
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        autocorrect: false,
                        textCapitalization: TextCapitalization.none,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return AppLocalizations.of(
                              context,
                            )!.enterEmail;
                          }
                          if (!RegExp(r'^\S+@\S+\.\S+$').hasMatch(value)) {
                            return AppLocalizations.of(
                              context,
                            )!.invalidEmail;
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),

                      TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          labelText: AppLocalizations.of(
                            context,
                          )!.password,
                          border: OutlineInputBorder(),
                        ),
                        autocorrect: false,
                        textCapitalization: TextCapitalization.none,
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return AppLocalizations.of(
                              context,
                            )!.enteredPasswordMessage;
                          }
                          if (value.trim().length < 6) {
                            return AppLocalizations.of(
                              context,
                            )!.enteredPasswordErrorMessage;
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),

                      if (!_isLogin)
                        TextFormField(
                          controller: _confirmController,
                          decoration: InputDecoration(
                            labelText: AppLocalizations.of(
                              context,
                            )!.confirmPassword,
                            border: OutlineInputBorder(),
                          ),
                          autocorrect: false,
                          textCapitalization: TextCapitalization.none,
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppLocalizations.of(
                                context,
                              )!.confirmPasswordMessage;
                            }
                            if (value != _passwordController.text) {
                              return AppLocalizations.of(
                                context,
                              )!.confirmPasswordErrorMessage;
                            }
                            return null;
                          },
                        ),
                      SizedBox(height: 40),

                      ElevatedButton(
                        onPressed: _isLoading ? null : _submit,
                        child: _isLoading
                            ? SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              )
                            : Text(
                                _isLogin
                                    ? AppLocalizations.of(context)!.login
                                    : AppLocalizations.of(context)!.signUp,
                              ),
                      ),
                      SizedBox(height: 2),

                      TextButton(
                        onPressed: _toggleForm,
                        child: Text(
                          _isLogin
                              ? AppLocalizations.of(context)!.newSignUp
                              : AppLocalizations.of(context)!.oldLogin,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
