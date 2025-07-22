#  Book Explorer App

A Flutter-based mobile app to explore and save books. Built with Firebase authentication and Bloc state management, the app features smooth navigation, dark/light theme support, and modular architecture. Developed as part of an interview project.

---
Email: test@gmail.com

Password: Test123#

##  App Features and Flow

-  **Firebase Login** (email/password)
  - Users must log in to use the app.
  - If logged out, app redirects to login on restart.
  - 🔁 **Note:** Logging out **won’t immediately navigate** to the login screen — but if the user is logged out, they **cannot access book details** or protected content.

-  **Book List**
  - Browse books categorized by genre (e.g., Sci-Fi, History, etc.).
  - Filter using horizontal category chips.

-  **Book Detail View**
  - Tap any book to view full details: title, author, summary, and rating.
  - Start reading (stub action for now).
  - Bookmark toggle with persistent state via Bloc.

-  **Reading List**
  - View saved (bookmarked) books only.

-  **Finish/Stats Screen**
  - Currently shows hardcoded statistics (books read/saved).
  - Will be powered by Firebase + Hive in the future.

-  **Theme Support**
  - Toggle between light and dark mode globally.

---

##  Architecture Summary

The app uses a clean, scalable architecture with clearly separated concerns:

lib/
├── data/
│ └── models/ # Book model
├── logic/
│ └── cubits/ # BookCubit, ThemeCubit, AuthCubit (Bloc)
├── ui/
│ ├── screens/ # Login, BookList, BookDetail, ReadingList, Finish
│ └── components/ # Reusable widgets: AppBar, Buttons, Filters
├── main.dart # Entry point with Firebase init + GoRouter
└── app_router.dart # Routes and auth guard logic using GoRouter


- **State Management:** `flutter_bloc` using Cubits  
- **Navigation:** `go_router` with an `AuthGate` and redirect logic  
- **Authentication:** `firebase_auth`  
- **Persistence:** Hive planned (bookmarks, stats)  
- **Theme Handling:** ThemeCubit + `ThemeData` customization  

---

##  How to Run

```bash
cd book_explorer_app
flutter pub get
flutterfire configure  # Required for Firebase setup
flutter run

## Dependencies
 cupertino_icons: ^1.0.2
  flutter_bloc: ^8.1.3
  equatable: ^2.0.5
  go_router: ^13.0.1
  firebase_core: ^2.32.0
  firebase_auth: ^4.19.1
  hive: ^2.2.3
  hive_flutter: ^1.1.0



 ## Note:
 ## Due to time constraints while managing a full-time job, I couldn’t complete the bonus features like advanced stats and local persistence. However, I’m fully prepared to implement them and further improve the app if given more time.

## Author
Created by Mohammed Yaseen Adam Sahib as part of a technical Flutter developer interview challenge for smartdaddy.
