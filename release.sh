#!/bin/bash

# Release script for Gestion de Contact Flutter
# This script helps create releases for different platforms

set -e

echo "🚀 Starting release process..."

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if we're in the right directory
if [ ! -f "pubspec.yaml" ]; then
    print_error "Please run this script from the project root directory"
    exit 1
fi

# Get version from pubspec.yaml
VERSION=$(grep "version:" pubspec.yaml | sed 's/version: //')
print_status "Building version: $VERSION"

# Clean previous builds
print_status "Cleaning previous builds..."
flutter clean

# Get dependencies
print_status "Installing dependencies..."
flutter pub get

# Run tests
print_status "Running tests..."
flutter test

# Build for different platforms
print_status "Building Android APK..."
flutter build apk --release

print_status "Building Android AAB..."
flutter build appbundle --release

print_status "Building Web..."
flutter build web --release

print_status "Building Windows..."
flutter build windows --release

# Create release directory
RELEASE_DIR="releases/v$VERSION"
mkdir -p "$RELEASE_DIR"

# Copy build artifacts
print_status "Copying build artifacts..."
cp build/app/outputs/flutter-apk/app-release.apk "$RELEASE_DIR/"
cp build/app/outputs/bundle/release/app-release.aab "$RELEASE_DIR/"
cp -r build/web "$RELEASE_DIR/web"
cp -r build/windows/x64/runner/Release "$RELEASE_DIR/windows"

# Create checksums
print_status "Creating checksums..."
cd "$RELEASE_DIR"
sha256sum app-release.apk > app-release.apk.sha256
sha256sum app-release.aab > app-release.aab.sha256
cd ../..

print_status "✅ Release build completed!"
print_status "Release artifacts are available in: $RELEASE_DIR"
print_status ""
print_status "Next steps:"
print_status "1. Test the builds on your devices"
print_status "2. Create a new GitHub release with tag v$VERSION"
print_status "3. Upload the build artifacts to the release"
print_status "4. Update the changelog if needed"