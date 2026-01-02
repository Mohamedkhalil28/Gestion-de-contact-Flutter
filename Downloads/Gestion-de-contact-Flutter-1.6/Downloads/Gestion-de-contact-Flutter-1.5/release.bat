@echo off
REM Release script for Gestion de Contact Flutter (Windows)
REM This script helps create releases for different platforms

echo 🚀 Starting release process...

REM Check if we're in the right directory
if not exist "pubspec.yaml" (
    echo [ERROR] Please run this script from the project root directory
    exit /b 1
)

REM Get version from pubspec.yaml
for /f "tokens=2 delims=: " %%a in ('findstr "version:" pubspec.yaml') do set VERSION=%%a
echo [INFO] Building version: %VERSION%

REM Clean previous builds
echo [INFO] Cleaning previous builds...
flutter clean

REM Get dependencies
echo [INFO] Installing dependencies...
flutter pub get

REM Run tests
echo [INFO] Running tests...
flutter test

REM Build for different platforms
echo [INFO] Building Android APK...
flutter build apk --release

echo [INFO] Building Android AAB...
flutter build appbundle --release

echo [INFO] Building Web...
flutter build web --release

echo [INFO] Building Windows...
flutter build windows --release

REM Create release directory
set RELEASE_DIR=releases\v%VERSION%
if not exist "%RELEASE_DIR%" mkdir "%RELEASE_DIR%"

REM Copy build artifacts
echo [INFO] Copying build artifacts...
copy build\app\outputs\flutter-apk\app-release.apk "%RELEASE_DIR%\"
copy build\app\outputs\bundle\release\app-release.aab "%RELEASE_DIR%\"
xcopy build\web "%RELEASE_DIR%\web\" /E /I /H /Y
xcopy build\windows\x64\runner\Release "%RELEASE_DIR%\windows\" /E /I /H /Y

REM Create checksums
echo [INFO] Creating checksums...
cd "%RELEASE_DIR%"
powershell "Get-FileHash app-release.apk -Algorithm SHA256 | Select-Object -ExpandProperty Hash > app-release.apk.sha256"
powershell "Get-FileHash app-release.aab -Algorithm SHA256 | Select-Object -ExpandProperty Hash > app-release.aab.sha256"
cd ..\..

echo [INFO] ✅ Release build completed!
echo [INFO] Release artifacts are available in: %RELEASE_DIR%
echo.
echo [INFO] Next steps:
echo [INFO] 1. Test the builds on your devices
echo [INFO] 2. Create a new GitHub release with tag v%VERSION%
echo [INFO] 3. Upload the build artifacts to the release
echo [INFO] 4. Update the changelog if needed

pause