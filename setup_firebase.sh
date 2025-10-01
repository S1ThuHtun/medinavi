#!/bin/bash

# Firebase Setup Script for MediNavi
# This script guides you through setting up Firebase Authentication
# Run this script or follow the commands manually

set -e  # Exit on error

echo "🔥 Firebase Authentication Setup for MediNavi"
echo "=============================================="
echo ""

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Check if we're in the right directory
if [ ! -f "pubspec.yaml" ]; then
    echo -e "${RED}Error: pubspec.yaml not found. Please run this script from the project root.${NC}"
    exit 1
fi

echo -e "${BLUE}Step 1: Checking prerequisites...${NC}"
echo ""

# Check Flutter
if ! command -v flutter &> /dev/null; then
    echo -e "${RED}✗ Flutter is not installed${NC}"
    echo "  Please install Flutter: https://flutter.dev/docs/get-started/install"
    exit 1
else
    echo -e "${GREEN}✓ Flutter is installed${NC}"
    flutter --version | head -1
fi
echo ""

# Check Node.js
if ! command -v node &> /dev/null; then
    echo -e "${YELLOW}✗ Node.js is not installed${NC}"
    echo "  Node.js is required for Firebase CLI"
    echo "  Install from: https://nodejs.org/"
    echo ""
    read -p "Do you want to continue without Firebase CLI? (y/n) " -n 1 -r
    echo ""
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 1
    fi
else
    echo -e "${GREEN}✓ Node.js is installed${NC}"
    node --version
fi
echo ""

# Check/Install Firebase CLI
echo -e "${BLUE}Step 2: Setting up Firebase CLI...${NC}"
echo ""

if ! command -v firebase &> /dev/null; then
    echo -e "${YELLOW}Firebase CLI is not installed${NC}"
    read -p "Install Firebase CLI now? (y/n) " -n 1 -r
    echo ""
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo "Installing Firebase CLI..."
        npm install -g firebase-tools
        echo -e "${GREEN}✓ Firebase CLI installed${NC}"
    else
        echo -e "${YELLOW}Skipping Firebase CLI installation${NC}"
        echo "You can install it later with: npm install -g firebase-tools"
    fi
else
    echo -e "${GREEN}✓ Firebase CLI is installed${NC}"
    firebase --version
fi
echo ""

# Login to Firebase
if command -v firebase &> /dev/null; then
    echo -e "${BLUE}Step 3: Logging in to Firebase...${NC}"
    echo ""
    
    if firebase projects:list &> /dev/null; then
        echo -e "${GREEN}✓ Already logged in to Firebase${NC}"
    else
        echo "Logging in to Firebase..."
        firebase login
    fi
    echo ""
fi

# Check/Install FlutterFire CLI
echo -e "${BLUE}Step 4: Setting up FlutterFire CLI...${NC}"
echo ""

if ! command -v flutterfire &> /dev/null; then
    echo -e "${YELLOW}FlutterFire CLI is not installed${NC}"
    read -p "Install FlutterFire CLI now? (y/n) " -n 1 -r
    echo ""
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo "Installing FlutterFire CLI..."
        dart pub global activate flutterfire_cli
        echo -e "${GREEN}✓ FlutterFire CLI installed${NC}"
        echo ""
        echo -e "${YELLOW}Note: Make sure pub cache bin is in your PATH${NC}"
        echo "  macOS/Linux: export PATH=\"\$PATH\":\"\$HOME/.pub-cache/bin\""
        echo "  Windows: Add %LOCALAPPDATA%\\Pub\\Cache\\bin to PATH"
    else
        echo -e "${YELLOW}Skipping FlutterFire CLI installation${NC}"
        echo "You can install it later with: dart pub global activate flutterfire_cli"
    fi
else
    echo -e "${GREEN}✓ FlutterFire CLI is installed${NC}"
    flutterfire --version || echo "Version check failed, but CLI is installed"
fi
echo ""

# Configure Firebase
echo -e "${BLUE}Step 5: Configuring Firebase for your project...${NC}"
echo ""

if command -v flutterfire &> /dev/null; then
    echo "Running flutterfire configure..."
    echo "This will:"
    echo "  1. Let you select/create a Firebase project"
    echo "  2. Select platforms (Android, iOS, Web, macOS)"
    echo "  3. Generate firebase_options.dart"
    echo "  4. Create platform-specific config files"
    echo ""
    read -p "Run flutterfire configure now? (y/n) " -n 1 -r
    echo ""
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        flutterfire configure
        echo ""
        echo -e "${GREEN}✓ Firebase configuration complete${NC}"
    else
        echo -e "${YELLOW}Skipping Firebase configuration${NC}"
        echo "Run manually later with: flutterfire configure"
    fi
else
    echo -e "${YELLOW}FlutterFire CLI not available${NC}"
    echo "Install it and run: flutterfire configure"
fi
echo ""

# Install dependencies
echo -e "${BLUE}Step 6: Installing Flutter dependencies...${NC}"
echo ""
flutter pub get
echo -e "${GREEN}✓ Dependencies installed${NC}"
echo ""

# Final instructions
echo -e "${BLUE}Step 7: Enable Authentication in Firebase Console${NC}"
echo ""
echo "Please complete these steps in Firebase Console:"
echo "  1. Go to https://console.firebase.google.com/"
echo "  2. Select your project"
echo "  3. Navigate to: Build → Authentication"
echo "  4. Click 'Get started'"
echo "  5. Go to 'Sign-in method' tab"
echo "  6. Enable 'Email/Password'"
echo "  7. Click 'Save'"
echo ""
read -p "Press Enter once you've completed the above steps..."
echo ""

# Test build
echo -e "${BLUE}Step 8: Testing build...${NC}"
echo ""
read -p "Run a test build? (y/n) " -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Building..."
    if flutter build apk --debug 2>/dev/null; then
        echo -e "${GREEN}✓ Build successful${NC}"
    else
        echo -e "${YELLOW}Build failed, but setup is complete${NC}"
        echo "Try: flutter clean && flutter pub get && flutter build apk --debug"
    fi
else
    echo "Skipping test build"
fi
echo ""

# Summary
echo ""
echo "================================================"
echo -e "${GREEN}✨ Firebase Setup Complete!${NC}"
echo "================================================"
echo ""
echo "Next steps:"
echo "  1. Run the app: flutter run"
echo "  2. Test sign up with an email and password"
echo "  3. Check Firebase Console to see the user"
echo ""
echo "Documentation:"
echo "  • Quick Start:  QUICKSTART.md"
echo "  • Full Guide:   FIREBASE_SETUP.md"
echo "  • Architecture: ARCHITECTURE.md"
echo "  • Checklist:    FIREBASE_CHECKLIST.md"
echo ""
echo "Troubleshooting:"
echo "  • If build fails: flutter clean && flutter pub get"
echo "  • If Firebase not initialized: flutterfire configure"
echo "  • See: FIREBASE_SETUP.md (Troubleshooting section)"
echo ""
echo "Happy coding! 🚀"
