import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../logic/cubits/auth_cubit.dart';
import '../screens/login/login_screen.dart';
import '../screens/home_screen.dart';

class AuthGate extends StatelessWidget {
  final Widget child;

  const AuthGate({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is Authenticated) {
          return child; // Proceed to the app
        } else if (state is Unauthenticated) {
          // Redirect to Login
          Future.microtask(() => context.go('/login'));
          return const SizedBox.shrink();
        } else {
          // Loading state
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
