# Firebase Authentication Setup Guide

This guide will walk you through setting up Firebase Authentication for the MediNavi app.

## Prerequisites

1. A Google account
2. Flutter installed on your system
3. Node.js installed (for Firebase CLI)

## Step 1: Create a Firebase Project

1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Click "Add project" or select an existing project
3. Enter project name (e.g., "medinavi")
4. Follow the setup wizard to create your project

## Step 2: Enable Authentication

1. In your Firebase project, navigate to **Build** > **Authentication**
2. Click **Get started**
3. Go to the **Sign-in method** tab
4. Enable **Email/Password** authentication:
   - Click on "Email/Password"
   - Toggle "Enable" to ON
   - Click "Save"

## Step 3: Install Firebase CLI and FlutterFire CLI

```bash
# Install Firebase CLI globally
npm install -g firebase-tools

# Login to Firebase
firebase login

# Install FlutterFire CLI
dart pub global activate flutterfire_cli
```

Make sure the FlutterFire CLI is in your PATH:
- On macOS/Linux: Add `export PATH="$PATH":"$HOME/.pub-cache/bin"` to your `.bashrc` or `.zshrc`
- On Windows: Add `%LOCALAPPDATA%\Pub\Cache\bin` to your PATH environment variable

## Step 4: Configure Firebase for Your Flutter App

Navigate to your project directory and run:

```bash
cd /path/to/medinavi
flutterfire configure
```

This command will:
1. Ask you to select your Firebase project
2. Ask which platforms you want to support (select Android, iOS, Web, macOS as needed)
3. Automatically generate `lib/firebase_options.dart` with your Firebase configuration
4. Add the necessary configuration files for each platform:
   - Android: `android/app/google-services.json`
   - iOS: `ios/Runner/GoogleService-Info.plist`
   - macOS: `macos/Runner/GoogleService-Info.plist`

## Step 5: Verify Configuration

After running `flutterfire configure`, verify that:

1. `lib/firebase_options.dart` has been updated with your actual Firebase credentials (not placeholder values)
2. Platform-specific configuration files have been created:
   - For Android: `android/app/google-services.json`
   - For iOS: `ios/Runner/GoogleService-Info.plist`
   - For macOS: `macos/Runner/GoogleService-Info.plist`

## Step 6: Install Dependencies

Run the following command to install the required packages:

```bash
flutter pub get
```

## Step 7: Test the Authentication

1. Run the app on your preferred platform:
   ```bash
   # For Android
   flutter run -d android
   
   # For iOS
   flutter run -d ios
   
   # For Web
   flutter run -d chrome
   
   # For macOS
   flutter run -d macos
   ```

2. Try to sign up with a new email and password
3. Check the Firebase Console > Authentication > Users to see if the user was created
4. Try to log in with the same credentials

## Troubleshooting

### Issue: "No Firebase App '[DEFAULT]' has been created"
- Make sure you've run `flutterfire configure`
- Verify that `Firebase.initializeApp()` is called in `main.dart` before `runApp()`

### Issue: "Failed to get document because the client is offline"
- Check your internet connection
- Verify Firebase project settings in the Firebase Console

### Issue: "API key not valid"
- Re-run `flutterfire configure` to regenerate configuration files
- Verify that your Firebase project exists and is active

### Issue: Android build fails with google-services plugin error
- Ensure `com.google.gms:google-services` is added to `android/build.gradle.kts`
- Ensure `com.google.gms.google-services` plugin is applied in `android/app/build.gradle.kts`
- Make sure `google-services.json` exists in `android/app/` directory

### Issue: iOS/macOS build fails
- Ensure `GoogleService-Info.plist` is added to the Xcode project
- Open Xcode and verify the file is in the project navigator
- Clean build folder: `flutter clean && flutter pub get`

## Additional Configuration for Web

For web deployment, you may need to add Firebase SDK scripts to `web/index.html`. However, with FlutterFire, this is handled automatically through the Dart packages.

## Security Best Practices

1. **Never commit sensitive Firebase config files to public repositories** - While the API keys in these files are safe for client-side apps (they're meant to identify your Firebase project), it's still good practice to keep them private.

2. **Set up Firebase Security Rules** - Configure proper security rules in Firebase Console for your database and storage

3. **Enable App Check** (Optional but recommended):
   - Go to Firebase Console > Build > App Check
   - Register your app
   - This adds an extra layer of security

4. **Use Environment Variables for Additional Secrets** - For any additional API keys or secrets, use environment variables instead of hardcoding

## Next Steps

Now that Firebase Authentication is set up, you can:

1. Add more authentication methods (Google Sign-In, Apple Sign-In, etc.)
2. Implement password reset functionality
3. Add email verification
4. Set up user profiles with Firestore
5. Implement proper navigation based on authentication state

## Resources

- [Firebase Documentation](https://firebase.google.com/docs)
- [FlutterFire Documentation](https://firebase.flutter.dev/)
- [Firebase Authentication Documentation](https://firebase.google.com/docs/auth)
- [FlutterFire CLI Documentation](https://firebase.flutter.dev/docs/cli/)
