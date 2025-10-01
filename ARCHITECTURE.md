# Firebase Integration Architecture

## Overview

This document explains how Firebase Authentication is integrated into the MediNavi app.

## Architecture Diagram

```
┌─────────────────────────────────────────────────────────────┐
│                         MediNavi App                         │
└─────────────────────────────────────────────────────────────┘
                              │
                              │ Firebase.initializeApp()
                              ▼
┌─────────────────────────────────────────────────────────────┐
│                      Firebase Core                           │
│                  (firebase_core package)                     │
└─────────────────────────────────────────────────────────────┘
                              │
                ┌─────────────┴─────────────┐
                ▼                           ▼
┌──────────────────────────┐    ┌─────────────────────────┐
│   Firebase Auth SDK      │    │  firebase_options.dart  │
│ (firebase_auth package)  │    │   (Configuration)       │
└──────────────────────────┘    └─────────────────────────┘
                │
                ▼
┌─────────────────────────────────────────────────────────────┐
│                      AuthService                             │
│             (lib/services/auth_service.dart)                 │
│  ┌───────────────────────────────────────────────────────┐  │
│  │ - signUpWithEmailAndPassword()                        │  │
│  │ - signInWithEmailAndPassword()                        │  │
│  │ - signOut()                                           │  │
│  │ - authStateChanges (Stream)                           │  │
│  └───────────────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────┐
│                    SignUpScreen                              │
│          (lib/screens/sign_up_screen.dart)                   │
│  ┌───────────────────────────────────────────────────────┐  │
│  │ - Email/Password Input Forms                          │  │
│  │ - Form Validation                                     │  │
│  │ - Calls AuthService methods                           │  │
│  │ - Shows loading state                                 │  │
│  │ - Displays success/error messages                     │  │
│  └───────────────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────────────┘
```

## Data Flow

### Sign Up Flow
```
User Input (Email + Password)
    │
    ▼
Form Validation (sign_up_screen.dart)
    │
    ▼
AuthService.signUpWithEmailAndPassword()
    │
    ▼
Firebase Auth SDK
    │
    ▼
Firebase Backend
    │
    ├─── Success ──→ User Created in Firebase
    │                     │
    │                     ▼
    │              Show Success Message
    │                     │
    │                     ▼
    │              Clear Form Fields
    │
    └─── Error ────→ FirebaseAuthException
                          │
                          ▼
                    Error Handling
                          │
                          ▼
                    Show Error Message
```

### Sign In Flow
```
User Input (Email + Password)
    │
    ▼
Form Validation (sign_up_screen.dart)
    │
    ▼
AuthService.signInWithEmailAndPassword()
    │
    ▼
Firebase Auth SDK
    │
    ▼
Firebase Backend
    │
    ├─── Success ──→ User Authenticated
    │                     │
    │                     ▼
    │              Show Success Message
    │                     │
    │                     ▼
    │              Clear Form Fields
    │
    └─── Error ────→ FirebaseAuthException
                          │
                          ▼
                    Error Handling
                          │
                          ▼
                    Show Error Message
```

## File Structure

```
medinavi/
├── lib/
│   ├── main.dart                    # Firebase initialization
│   ├── firebase_options.dart        # Firebase config (generated)
│   ├── services/
│   │   └── auth_service.dart       # Authentication logic
│   ├── screens/
│   │   └── sign_up_screen.dart     # UI for auth
│   └── ...
├── android/
│   ├── build.gradle.kts            # Firebase plugin added
│   └── app/
│       ├── build.gradle.kts        # Google services plugin
│       └── google-services.json    # Android config (generated)
├── ios/
│   └── Runner/
│       └── GoogleService-Info.plist # iOS config (generated)
├── pubspec.yaml                     # Firebase dependencies
└── FIREBASE_SETUP.md               # Setup documentation
```

## Key Components

### 1. Firebase Initialization (main.dart)
- Initializes Firebase before running the app
- Uses platform-specific configurations from firebase_options.dart
- Must complete before any Firebase services are used

### 2. Authentication Service (auth_service.dart)
- Wrapper around Firebase Auth SDK
- Provides clean API for auth operations
- Handles Firebase exceptions and provides user-friendly error messages
- Exposes auth state changes as a stream

### 3. Sign Up Screen (sign_up_screen.dart)
- UI for user authentication
- Switches between login and sign-up modes
- Form validation (email format, password length, password confirmation)
- Shows loading state during authentication
- Displays success/error feedback to users

### 4. Firebase Options (firebase_options.dart)
- Auto-generated by FlutterFire CLI
- Contains platform-specific configuration (API keys, project IDs, etc.)
- Different configurations for Android, iOS, Web, macOS

## Configuration Files

### Android
- `google-services.json`: Contains Android app configuration
- Generated by Firebase Console or FlutterFire CLI
- Must be placed in `android/app/` directory

### iOS/macOS
- `GoogleService-Info.plist`: Contains iOS/macOS app configuration
- Generated by Firebase Console or FlutterFire CLI
- Must be added to Xcode project

### Web
- Configuration embedded in `firebase_options.dart`
- No separate file needed

## Security Considerations

### API Keys in firebase_options.dart
- These API keys are **safe to commit** to version control
- They identify your Firebase project, not authenticate users
- They're meant to be included in client apps
- Real security comes from Firebase Security Rules

### Firebase Security Rules
- Control access to Firebase services
- Should be configured in Firebase Console
- Default rules for Auth are usually sufficient
- For Firestore/Storage, custom rules are needed

### Best Practices
1. Never store sensitive secrets in client code
2. Use Firebase Security Rules to protect data
3. Enable App Check for additional security
4. Implement proper password requirements
5. Add email verification (future enhancement)

## Error Handling

The AuthService handles common Firebase Auth errors:

| Error Code | User-Friendly Message |
|------------|----------------------|
| `weak-password` | "The password provided is too weak." |
| `email-already-in-use` | "An account already exists for that email." |
| `user-not-found` | "No user found for that email." |
| `wrong-password` | "Wrong password provided." |
| `invalid-email` | "The email address is not valid." |

## Future Enhancements

1. **Password Reset**
   - Add "Forgot Password" functionality
   - Use `FirebaseAuth.sendPasswordResetEmail()`

2. **Email Verification**
   - Verify user email after sign up
   - Use `User.sendEmailVerification()`

3. **Social Authentication**
   - Add Google Sign-In
   - Add Apple Sign-In (iOS)
   - Add Facebook Login

4. **Auth State Persistence**
   - Navigate based on auth state
   - Use StreamBuilder with `authStateChanges`

5. **User Profiles**
   - Store additional user data in Firestore
   - Create user profile screen

6. **Multi-factor Authentication**
   - Add phone verification
   - Implement 2FA

## Testing

### Manual Testing Checklist
- [ ] Sign up with valid email and password
- [ ] Verify user appears in Firebase Console
- [ ] Sign in with correct credentials
- [ ] Try to sign in with wrong password (should show error)
- [ ] Try to sign up with existing email (should show error)
- [ ] Try weak password (should show error)
- [ ] Try invalid email format (should show error)
- [ ] Verify loading state shows during auth operations

### Unit Testing (Future)
```dart
// Example test structure
test('signUpWithEmailAndPassword creates user', () async {
  // Test implementation
});

test('signInWithEmailAndPassword logs in user', () async {
  // Test implementation
});
```

## Resources

- [Firebase Auth Documentation](https://firebase.google.com/docs/auth)
- [FlutterFire Documentation](https://firebase.flutter.dev/)
- [Firebase Console](https://console.firebase.google.com/)
