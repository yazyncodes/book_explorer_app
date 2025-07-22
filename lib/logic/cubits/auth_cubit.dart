import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final FirebaseAuth _firebaseAuth;

  AuthCubit({FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        super(AuthInitial()) {
    _firebaseAuth.authStateChanges().listen(_authStateChanged);
  }

  void _authStateChanged(User? user) {
    if (user != null) {
      emit(Authenticated(user));
    } else {
      emit(Unauthenticated());
    }
  }

  /// ✅ Called manually in main.dart to emit current auth state
  void checkAuthStatus() {
    final user = _firebaseAuth.currentUser;
    _authStateChanged(user);
  }

  Future<void> signInWithEmail(String email, String password) async {
    emit(AuthLoading());
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      emit(AuthError(e.message ?? 'Authentication failed'));
    }
  }

  Future<void> signUpWithEmail(String email, String password) async {
    emit(AuthLoading());
    try {
      await _firebaseAuth.createUserWithEmailAndPassword( 
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      emit(AuthError(e.message ?? 'Sign up failed'));
    }
  }

  Future<void> signOut() async {
  await _firebaseAuth.signOut();
  _authStateChanged(null); 
}

}
