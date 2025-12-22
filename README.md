# 📰 News App (Flutter)

A Flutter news application built with Flutter using a clean, feature-based architecture.  
The app supports authentication and browsing news by category with proper state management.

---

## 🚀 Features
- User Authentication (Login & Signup)
- Browse news by categories
- State management using Bloc
- Clean and scalable architecture
- Responsive UI
- API integration
- Error handling

---

## 🛠 Tech Stack
- Flutter
- Dart
- REST API
- Dio
- Bloc / Flutter Bloc

---

## 📂 Project Structure
```
lib/
 ├── core/
 │    └── constants/
 │         └── api_colors.dart
 │
 ├── features/
 │    ├── auth/
 │    │    ├── views/
 │    │    │    ├── login_view.dart
 │    │    │    └── signup_view.dart
 │    │    │
 │    │    └── widgets/
 │    │         ├── custom_text.dart
 │    │         ├── email_text.dart
 │    │         └── password_text.dart
 │    │
 │    └── home/
 │         ├── bloc/
 │         │    ├── news_bloc.dart
 │         │    ├── news_event.dart
 │         │    └── news_state.dart
 │         │
 │         ├── data/
 │         │    ├── models/
 │         │    │    ├── article_model.dart
 │         │    │    └── category_model.dart
 │         │    │
 │         │    └── repos/
 │         │         └── news_repo.dart
 │         │
 │         ├── views/
 │         │    ├── category_view.dart
 │         │    └── home_view.dart
 │         │
 │         └── widgets/
 │              ├── category_list_view.dart
 │              ├── category_card.dart
 │              ├── news_list_view_builder.dart
 │              ├── news_list_view.dart
 │              └── news_tile.dart
 │
 └── main.dart
```

---

## ⚙️ Setup Instructions

### 1️⃣ Clone the repository
```bash
git clone https://github.com/ESRAA911/news_app.git
```

### 2️⃣ Navigate to the project directory
```bash
cd news_app
```

### 3️⃣ Install dependencies
```bash
flutter pub get
```

### 4️⃣ Run the app
```bash
flutter run
```

---

## 👩‍💻 Author
**Esraa Ibrahim**
