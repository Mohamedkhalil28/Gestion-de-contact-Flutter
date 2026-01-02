# 📱 Gestion de Contact Flutter

A modern Flutter application for managing contacts with MongoDB backend. Built with Material Design 3 and supports cross-platform deployment.

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![MongoDB](https://img.shields.io/badge/MongoDB-4EA94B?style=for-the-badge&logo=mongodb&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)

## ✨ Features

- 🔐 **Secure Login**: Simple authentication system
- ➕ **Add Contacts**: Create new contact entries
- ✏️ **Edit Contacts**: Update existing contact information
- 🗑️ **Delete Contacts**: Remove contacts from database
- 💾 **MongoDB Storage**: Persistent data storage with MongoDB
- 🎨 **Material Design 3**: Modern UI with latest design standards
- 📱 **Cross-Platform**: Works on Android, iOS, Web, Windows, macOS, and Linux

## 🚀 Quick Start

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (3.0.0 or higher)
- [MongoDB](https://www.mongodb.com/try/download/community) (local or cloud instance)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/your-username/gestion-de-contact-flutter.git
   cd gestion-de-contact-flutter
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Setup MongoDB**
   - **Local MongoDB**: Install and start MongoDB
     ```bash
     mongod
     ```
   - **MongoDB Atlas**: Create a cluster and get your connection string

4. **Configure Database Connection**
   - Open `lib/mongodb_service.dart`
   - Update the `_connectionString` with your MongoDB URI:
     ```dart
     static const String _connectionString = 'mongodb://localhost:27017/contacts_db';
     // Or for MongoDB Atlas:
     // static const String _connectionString = 'mongodb+srv://username:password@cluster.mongodb.net/contacts_db';
     ```

5. **Run the application**
   ```bash
   flutter run
   ```

## 📸 Screenshots

*Add screenshots of your app here*

## 🏗️ Project Structure

```
lib/
├── main.dart              # App entry point
├── login_page.dart        # Authentication screen
├── home_page.dart         # Main contacts list
├── contact_actions.dart   # CRUD operations
├── mongodb_service.dart   # Database service
└── models/
    └── contact.dart       # Contact data model
```

## 🛠️ Technologies Used

- **Frontend**: Flutter, Dart
- **Backend**: MongoDB
- **State Management**: StatefulWidget
- **UI Framework**: Material Design 3

## 🔧 Configuration

### Environment Variables

Create a `.env` file in the root directory (optional):

```env
MONGODB_URI=mongodb://localhost:27017/contacts_db
LOGIN_PASSWORD=1234
```

### Build Configuration

- **Debug Build**: `flutter build apk --debug`
- **Release Build**: `flutter build apk --release`
- **Web Build**: `flutter build web --release`

## � Releases

### Automated Release

Use the provided release scripts to build for all platforms:

**Windows:**
```bash
release.bat
```

**Linux/macOS:**
```bash
./release.sh
```

This will create builds for:
- Android APK and AAB
- Web application
- Windows executable

### Manual Release

1. **Create GitHub Release**
   - Go to your repository on GitHub
   - Click "Releases" → "Create a new release"
   - Tag: `v1.0.0` (or appropriate version)
   - Title: `Release v1.0.0`
   - Description: Copy from CHANGELOG.md

2. **Upload Build Artifacts**
   - APK: `releases/v1.0.0/app-release.apk`
   - AAB: `releases/v1.0.0/app-release.aab`
   - Web: `releases/v1.0.0/web/` (zip the folder)
   - Windows: `releases/v1.0.0/windows/` (zip the folder)

## �📝 Usage

1. **Login**: Use password `1234` to access the app
2. **View Contacts**: See all saved contacts in a list
3. **Add Contact**: Tap the + button to create new contacts
4. **Edit Contact**: Tap the edit icon on any contact
5. **Delete Contact**: Tap the delete icon to remove contacts

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- MongoDB team for the database
- Material Design team for the design system

---

**Note**: Make sure MongoDB is running before starting the application. The default login password is `1234`.
