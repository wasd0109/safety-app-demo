import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void login(String email, String password) async {
    emit(AuthLoading());
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      emit(AuthLoggedIn());
    } on FirebaseAuthException catch (err) {
      emit(AuthError(error: err));
    }
  }

  void getUser() => _firebaseAuth.currentUser;

  void startUp() {
    if (_firebaseAuth.currentUser == null) {
      return emit(AuthLoggedOut());
    }
    return emit(AuthLoggedIn());
  }
}
