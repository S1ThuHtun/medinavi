# medinavi

A new Flutter project with Firebase Authentication integration.

## Features

- Multi-language support (English, Japanese, Chinese)
- Firebase Authentication (Email/Password)
- Responsive UI with Material Design 3

## Getting Started

### Prerequisites

- Flutter SDK (3.9.2 or higher)
- Dart SDK
- Firebase account
- Node.js (for Firebase CLI)

### Firebase Setup

This project requires Firebase Authentication to be configured. Follow these steps:

1. **Install Firebase CLI and FlutterFire CLI:**
   ```bash
   npm install -g firebase-tools
   firebase login
   dart pub global activate flutterfire_cli
   ```

2. **Configure Firebase for this project:**
   ```bash
   cd medinavi
   flutterfire configure
   ```
   
   This will:
   - Create or select a Firebase project
   - Generate `lib/firebase_options.dart` with your configuration
   - Add platform-specific config files (google-services.json for Android, GoogleService-Info.plist for iOS/macOS)

3. **Enable Email/Password Authentication:**
   - Go to [Firebase Console](https://console.firebase.google.com/)
   - Select your project
   - Navigate to Authentication → Sign-in method
   - Enable "Email/Password" provider

For detailed instructions, see [FIREBASE_SETUP.md](FIREBASE_SETUP.md)

### Installation

1. Clone the repository
2. Run `flutter pub get` to install dependencies
3. Configure Firebase (see above)
4. Run the app:
   ```bash
   flutter run
   ```

## Project Structure

```
lib/
├── l10n/                     # Localization files
├── screens/                  # UI screens
│   ├── sign_up_screen.dart  # Authentication screen
│   └── startup_screen.dart  # Initial screen
├── services/                 # Business logic
│   └── auth_service.dart    # Firebase authentication service
├── widgets/                  # Reusable widgets
├── firebase_options.dart     # Firebase configuration (generated)
└── main.dart                # App entry point
```

## Authentication

The app uses Firebase Authentication with email/password sign-in. The authentication flow:

1. Users can sign up with email and password
2. Users can log in with existing credentials
3. Password validation (minimum 6 characters)
4. Email format validation
5. Error handling for common Firebase auth errors

## Localization

The app supports multiple languages:
- English (en)
- Japanese (ja)
- Chinese (zh)

To add new translations, edit the files in `lib/l10n/` and run:
```bash
flutter gen-l10n
```

## Building for Production

### Android
```bash
flutter build apk --release
# or
flutter build appbundle --release
```

### iOS
```bash
flutter build ios --release
```

### Web
```bash
flutter build web --release
```

## Resources

A few resources to get you started with Flutter development:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)
- [Flutter Documentation](https://docs.flutter.dev/)
- [Firebase for Flutter](https://firebase.flutter.dev/)

## License

This project is private and not published to pub.dev.

