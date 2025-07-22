import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:book_explorer_app/presentation/screens/splash/splash_screen.dart';
import 'package:book_explorer_app/presentation/screens/login/login_screen.dart';
import 'package:book_explorer_app/presentation/screens/home_screen.dart';
import 'package:book_explorer_app/presentation/screens/books/book_detail_screen.dart';
import 'package:book_explorer_app/presentation/screens/books/reading_list_screen.dart';

import 'package:book_explorer_app/data/dummy_books.dart';
import 'package:book_explorer_app/logic/cubits/auth_cubit.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  static final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    
    // ✅ You can still keep redirect logic
    redirect: (context, state) {
      final authState = BlocProvider.of<AuthCubit>(context).state;
      final isLoggedIn = authState is Authenticated;
      final isLoggingIn = state.fullPath == '/login';

      if (!isLoggedIn && !isLoggingIn) return '/login';
      if (isLoggedIn && isLoggingIn) return '/books';

      return null;
    },

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
        builder: (_, __) => const ReadingListScreen(),
      ),
    ],
  );
}
