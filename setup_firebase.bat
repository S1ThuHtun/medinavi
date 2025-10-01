@echo off
REM Firebase Setup Script for MediNavi (Windows)
REM This script guides you through setting up Firebase Authentication

echo.
echo ========================================
echo  Firebase Authentication Setup for MediNavi
echo ========================================
echo.

REM Check if we're in the right directory
if not exist pubspec.yaml (
    echo Error: pubspec.yaml not found. Please run this script from the project root.
    pause
    exit /b 1
)

echo Step 1: Checking prerequisites...
echo.

REM Check Flutter
where flutter >nul 2>nul
if %errorlevel% neq 0 (
    echo [X] Flutter is not installed
    echo     Please install Flutter: https://flutter.dev/docs/get-started/install
    pause
    exit /b 1
) else (
    echo [OK] Flutter is installed
    flutter --version | findstr /C:"Flutter"
)
echo.

REM Check Node.js
where node >nul 2>nul
if %errorlevel% neq 0 (
    echo [X] Node.js is not installed
    echo     Node.js is required for Firebase CLI
    echo     Install from: https://nodejs.org/
    echo.
    set /p continue="Do you want to continue without Firebase CLI? (y/n): "
    if /i not "%continue%"=="y" exit /b 1
) else (
    echo [OK] Node.js is installed
    node --version
)
echo.

REM Check/Install Firebase CLI
echo Step 2: Setting up Firebase CLI...
echo.

where firebase >nul 2>nul
if %errorlevel% neq 0 (
    echo Firebase CLI is not installed
    set /p install="Install Firebase CLI now? (y/n): "
    if /i "%install%"=="y" (
        echo Installing Firebase CLI...
        npm install -g firebase-tools
        echo [OK] Firebase CLI installed
    ) else (
        echo Skipping Firebase CLI installation
        echo You can install it later with: npm install -g firebase-tools
    )
) else (
    echo [OK] Firebase CLI is installed
    firebase --version
)
echo.

REM Login to Firebase
where firebase >nul 2>nul
if %errorlevel% equ 0 (
    echo Step 3: Logging in to Firebase...
    echo.
    
    firebase projects:list >nul 2>nul
    if %errorlevel% equ 0 (
        echo [OK] Already logged in to Firebase
    ) else (
        echo Logging in to Firebase...
        firebase login
    )
    echo.
)

REM Check/Install FlutterFire CLI
echo Step 4: Setting up FlutterFire CLI...
echo.

where flutterfire >nul 2>nul
if %errorlevel% neq 0 (
    echo FlutterFire CLI is not installed
    set /p install="Install FlutterFire CLI now? (y/n): "
    if /i "%install%"=="y" (
        echo Installing FlutterFire CLI...
        dart pub global activate flutterfire_cli
        echo [OK] FlutterFire CLI installed
        echo.
        echo Note: Make sure pub cache bin is in your PATH
        echo       Add %%LOCALAPPDATA%%\Pub\Cache\bin to PATH
        echo.
        pause
    ) else (
        echo Skipping FlutterFire CLI installation
        echo You can install it later with: dart pub global activate flutterfire_cli
    )
) else (
    echo [OK] FlutterFire CLI is installed
    flutterfire --version 2>nul || echo Version check failed, but CLI is installed
)
echo.

REM Configure Firebase
echo Step 5: Configuring Firebase for your project...
echo.

where flutterfire >nul 2>nul
if %errorlevel% equ 0 (
    echo Running flutterfire configure...
    echo This will:
    echo   1. Let you select/create a Firebase project
    echo   2. Select platforms (Android, iOS, Web, Windows)
    echo   3. Generate firebase_options.dart
    echo   4. Create platform-specific config files
    echo.
    set /p configure="Run flutterfire configure now? (y/n): "
    if /i "%configure%"=="y" (
        flutterfire configure
        echo.
        echo [OK] Firebase configuration complete
    ) else (
        echo Skipping Firebase configuration
        echo Run manually later with: flutterfire configure
    )
) else (
    echo FlutterFire CLI not available
    echo Install it and run: flutterfire configure
)
echo.

REM Install dependencies
echo Step 6: Installing Flutter dependencies...
echo.
flutter pub get
echo [OK] Dependencies installed
echo.

REM Final instructions
echo Step 7: Enable Authentication in Firebase Console
echo.
echo Please complete these steps in Firebase Console:
echo   1. Go to https://console.firebase.google.com/
echo   2. Select your project
echo   3. Navigate to: Build -^> Authentication
echo   4. Click 'Get started'
echo   5. Go to 'Sign-in method' tab
echo   6. Enable 'Email/Password'
echo   7. Click 'Save'
echo.
pause
echo.

REM Test build
echo Step 8: Testing build...
echo.
set /p build="Run a test build? (y/n): "
if /i "%build%"=="y" (
    echo Building...
    flutter build apk --debug 2>nul
    if %errorlevel% equ 0 (
        echo [OK] Build successful
    ) else (
        echo Build failed, but setup is complete
        echo Try: flutter clean ^&^& flutter pub get ^&^& flutter build apk --debug
    )
) else (
    echo Skipping test build
)
echo.

REM Summary
echo.
echo ================================================
echo   Firebase Setup Complete!
echo ================================================
echo.
echo Next steps:
echo   1. Run the app: flutter run
echo   2. Test sign up with an email and password
echo   3. Check Firebase Console to see the user
echo.
echo Documentation:
echo   - Quick Start:  QUICKSTART.md
echo   - Full Guide:   FIREBASE_SETUP.md
echo   - Architecture: ARCHITECTURE.md
echo   - Checklist:    FIREBASE_CHECKLIST.md
echo.
echo Troubleshooting:
echo   - If build fails: flutter clean ^&^& flutter pub get
echo   - If Firebase not initialized: flutterfire configure
echo   - See: FIREBASE_SETUP.md (Troubleshooting section)
echo.
echo Happy coding!
echo.
pause
