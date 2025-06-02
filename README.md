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

[Screen_Recording.webm](https://github.com/user-attachments/assets/fe411d88-5167-46ca-9b54-b87b997cf1d3)


## 📸 Screenshots
<h3 align="center">📸 Screenshots</h3>
<p align="center">
  <img src="https://github.com/user-attachments/assets/aea0c598-7edf-4e82-ba9e-aeb05d67d487" width="200"/>
  <img src="https://github.com/user-attachments/assets/e8665cc7-95a3-4833-bccc-5e77c0a51e9f" width="200"/>
  <img src="https://github.com/user-attachments/assets/0470c16f-0a9c-42e7-b7ea-90f71d8ec1c9" width="200"/>
</p>

<p align="center">
  <img src="https://github.com/user-attachments/assets/fed9946b-f140-4796-8dc7-8dc95a134ac5" width="200"/>
  <img src="https://github.com/user-attachments/assets/5520cd2f-5264-47da-a921-776e45fb7ae1" width="200"/>
  <img src="https://github.com/user-attachments/assets/c947b39e-042c-4286-a03a-4bbd2a0b1293" width="200"/>
</p>




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
