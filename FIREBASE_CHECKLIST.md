# Firebase Setup Checklist

Use this checklist to ensure Firebase is properly configured for the MediNavi app.

## ✅ Pre-Setup Checklist

- [ ] Flutter SDK installed (run `flutter --version`)
- [ ] Node.js installed (run `node --version`)
- [ ] Git installed (run `git --version`)
- [ ] Have a Google account for Firebase
- [ ] Code editor installed (VS Code, Android Studio, etc.)

## ✅ Firebase Project Setup

- [ ] Go to [Firebase Console](https://console.firebase.google.com/)
- [ ] Create a new project or select existing one
- [ ] Enable Google Analytics (optional but recommended)
- [ ] Note down your Project ID

## ✅ Authentication Setup

- [ ] Navigate to Build → Authentication in Firebase Console
- [ ] Click "Get Started"
- [ ] Go to "Sign-in method" tab
- [ ] Enable "Email/Password" provider
- [ ] Save the changes

## ✅ CLI Tools Installation

- [ ] Install Firebase CLI: `npm install -g firebase-tools`
- [ ] Verify: `firebase --version`
- [ ] Login to Firebase: `firebase login`
- [ ] Install FlutterFire CLI: `dart pub global activate flutterfire_cli`
- [ ] Verify: `flutterfire --version`
- [ ] Add to PATH if needed (see [FIREBASE_SETUP.md](FIREBASE_SETUP.md))

## ✅ Project Configuration

- [ ] Navigate to project directory: `cd medinavi`
- [ ] Run FlutterFire configuration: `flutterfire configure`
- [ ] Select your Firebase project from the list
- [ ] Select platforms to support:
  - [ ] Android
  - [ ] iOS
  - [ ] Web
  - [ ] macOS
- [ ] Wait for configuration to complete

## ✅ Verify Generated Files

### Android
- [ ] File exists: `android/app/google-services.json`
- [ ] File contains valid JSON (not placeholder)
- [ ] Check `android/build.gradle.kts` has Google services classpath
- [ ] Check `android/app/build.gradle.kts` applies Google services plugin

### iOS
- [ ] File exists: `ios/Runner/GoogleService-Info.plist`
- [ ] File added to Xcode project (open in Xcode to verify)

### macOS
- [ ] File exists: `macos/Runner/GoogleService-Info.plist`
- [ ] File added to Xcode project (open in Xcode to verify)

### Dart
- [ ] File exists: `lib/firebase_options.dart`
- [ ] File contains real API keys (not "YOUR_API_KEY" placeholders)
- [ ] DefaultFirebaseOptions class is present

## ✅ Dependencies

- [ ] Run: `flutter pub get`
- [ ] Check `pubspec.yaml` has:
  - [ ] `firebase_core: ^3.8.1`
  - [ ] `firebase_auth: ^5.3.4`
- [ ] No dependency conflicts reported

## ✅ Code Integration

- [ ] `lib/main.dart` initializes Firebase
- [ ] `lib/services/auth_service.dart` exists
- [ ] `lib/screens/sign_up_screen.dart` uses AuthService
- [ ] Import statements are correct (no red underlines in IDE)

## ✅ Build Verification

### Android Build
- [ ] Run: `flutter build apk --debug`
- [ ] Build completes without errors
- [ ] No Google services plugin errors

### iOS Build (macOS only)
- [ ] Run: `flutter build ios --debug --no-codesign`
- [ ] Build completes without errors
- [ ] GoogleService-Info.plist included in build

### Web Build
- [ ] Run: `flutter build web`
- [ ] Build completes without errors

## ✅ Runtime Testing

- [ ] Run app: `flutter run`
- [ ] App starts without Firebase initialization errors
- [ ] No "Firebase app not initialized" errors in console
- [ ] Navigation to Sign Up screen works

## ✅ Authentication Testing

### Sign Up Flow
- [ ] Click "Sign Up" on the screen
- [ ] Enter valid email (e.g., test@example.com)
- [ ] Enter password (at least 6 characters)
- [ ] Confirm password (matching)
- [ ] Click Sign Up button
- [ ] Loading indicator appears
- [ ] Success message shows (green snackbar)
- [ ] User appears in Firebase Console → Authentication → Users

### Sign In Flow
- [ ] Switch to Login mode
- [ ] Enter registered email
- [ ] Enter correct password
- [ ] Click Login button
- [ ] Loading indicator appears
- [ ] Success message shows

### Error Handling
- [ ] Try signing up with existing email → See error message
- [ ] Try logging in with wrong password → See error message
- [ ] Try weak password (< 6 chars) → See validation error
- [ ] Try invalid email format → See validation error
- [ ] Try mismatched passwords in signup → See validation error

## ✅ Firebase Console Verification

- [ ] Open [Firebase Console](https://console.firebase.google.com/)
- [ ] Navigate to your project
- [ ] Go to Authentication → Users
- [ ] See test user(s) listed
- [ ] User UID is displayed
- [ ] Creation date is shown

## ✅ Production Readiness (Optional)

- [ ] Set up proper package name/bundle ID (not com.example.medinavi)
- [ ] Configure Firebase Security Rules
- [ ] Enable App Check (recommended)
- [ ] Add email verification
- [ ] Add password reset functionality
- [ ] Implement auth state persistence
- [ ] Add proper error logging
- [ ] Set up Firebase Crashlytics (recommended)

## ✅ Documentation Review

- [ ] Read [README.md](README.md)
- [ ] Read [FIREBASE_SETUP.md](FIREBASE_SETUP.md)
- [ ] Read [QUICKSTART.md](QUICKSTART.md)
- [ ] Read [ARCHITECTURE.md](ARCHITECTURE.md)
- [ ] Understand authentication flow
- [ ] Know how to troubleshoot common issues

## 🎉 Completion

If all items are checked, Firebase Authentication is fully configured and working!

## 📝 Notes

**Troubleshooting Resources:**
- Firebase Console: https://console.firebase.google.com/
- FlutterFire Docs: https://firebase.flutter.dev/
- Firebase Support: https://firebase.google.com/support

**Common Issues:**
- If build fails, run `flutter clean && flutter pub get`
- If iOS build fails, run `pod install` in ios/ directory
- If Firebase not initialized, verify `flutterfire configure` was run
- Check [FIREBASE_SETUP.md](FIREBASE_SETUP.md) troubleshooting section

**Next Steps After Setup:**
1. Implement password reset
2. Add email verification
3. Create user profile screen
4. Add more authentication providers
5. Implement auth state management
