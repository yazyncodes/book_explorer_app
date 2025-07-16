import 'package:book_explorer_app/presentation/screens/home_screen.dart';
import 'package:go_router/go_router.dart';
import '../screens/splash/splash_screen.dart';
import '../screens/login/login_screen.dart';
import '/data/dummy_books.dart';
import '../screens/books/book_detail_screen.dart';
import '../screens/books/reading_list_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (_, __) => const SplashScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (_, __) => const LoginScreen(),
      ),
      GoRoute(
        path: '/books',
        builder: (_, __) => const HomeScreen(),
      ),
      GoRoute(
  path: '/book/:id',
  builder: (context, state) {
    final id = state.pathParameters['id'];
    final book = dummyBooks.firstWhere((b) => b.id == id);
    return BookDetailScreen(book: book);
  },
),
 GoRoute(
        path: '/reading_list',
        builder: (context, state) => const ReadingListScreen(),
      ),
    ],
  );
}
