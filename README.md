# User Management App

A modern Flutter application for managing users and their posts with a clean, intuitive interface.

## 📱 Features

- View list of users
- Detailed user profiles
- Create and manage posts
- Clean and modern UI design
- Responsive layout
- State management using BLoC pattern

## 🎥 Demo

[Screen Recording Placeholder]
*Add a screen recording demonstrating the app's main features*

## 📸 Screenshots

[App Screenshots Placeholder]
*Add screenshots of the main screens:*
- User List Screen
- User Detail Screen
- Create Post Screen

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (latest stable version)
- Dart SDK (latest stable version)
- Android Studio / VS Code
- Git

### Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/user_management_app.git
```

2. Navigate to the project directory:
```bash
cd user_management_app
```

3. Install dependencies:
```bash
flutter pub get
```

4. Run the app:
```bash
flutter run
```

## 🏗️ Project Structure

```
lib/
├── app/
│   ├── routes/
│   │   └── app_routes.dart
│   └── theme/
├── core/
│   ├── error/
│   └── network/
├── data/
│   ├── datasources/
│   ├── models/
│   └── repositories/
├── domain/
│   ├── entities/
│   ├── repositories/
│   └── usecases/
└── presentation/
    ├── bloc/
    ├── pages/
    └── widgets/
```

## 🛠️ Architecture

This project follows Clean Architecture principles and uses the BLoC pattern for state management:

- **Presentation Layer**: Contains UI components, BLoC logic, and pages
- **Domain Layer**: Contains business logic, entities, and use cases
- **Data Layer**: Handles data operations, repositories, and models
- **Core**: Contains shared utilities and common functionality

## 📦 Dependencies

- **flutter_bloc**: For state management
- **dio**: For network requests
- **get_it**: For dependency injection
- **equatable**: For value equality
- **flutter_secure_storage**: For secure storage
- **shared_preferences**: For local storage

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👥 Authors

- Vikas Kasera 

## 📞 Contact

Project Link: [https://github.com/KASVIK26/user_management_app]