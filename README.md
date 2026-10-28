# Creative Shop

Creative Shop is a Flutter e-commerce/mobile storefront app for handmade and curated products. It includes browsing, favorites, cart management, profile information, and Firebase-powered authentication.

## Features

- Product browsing by category
- Favorite items management
- Shopping cart and checkout flow
- User authentication with Firebase
- Profile screen and account session handling
- Firebase-backed product data and user profile storage

## Screenshots

Add screenshots here to showcase the app experience:

- Home screen
- Product details
- Favorites
- Cart
- Profile

## Tech Stack

- Flutter
- Dart
- Firebase Authentication
- Cloud Firestore
- Shared Preferences
- Bloc state management

## Project Structure

```text
lib/
├── cubits/
│   ├── bottom_nav_bar/
│   ├── cart/
│   ├── item_card/
│   ├── login_screen/
│   ├── product_screen/
│   ├── session/
│   ├── sign_up/
│   └── ...
├── models/
├── repositories/
├── screens/
├── shared/
├── firebase_options.dart
├── main.dart
└── ...
```

## Getting Started

### Prerequisites

- Flutter SDK
- Dart SDK
- Android Studio or VS Code with Flutter plugins
- Firebase project configured for Android/iOS

### Install dependencies

```bash
flutter pub get
```

### Run the app

```bash
flutter run
```

### Firebase setup

1. Create a Firebase project in the Firebase console.
2. Enable Authentication and Firestore.
3. Add Android and iOS apps to the project.
4. Download the configuration files and make sure they are included in the Flutter app.
5. Deploy or update the Firestore and Storage security rules from the included files in this repository.

## Security Notes

- Passwords are handled by Firebase Authentication.
- Firestore stores only non-sensitive profile data.
- Security rules should be reviewed before production release.

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) before opening issues or pull requests.

## License

This project is licensed under the MIT License. See [LICENSE](LICENSE).
