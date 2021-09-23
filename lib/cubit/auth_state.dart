part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthLoggedIn extends AuthState {
  final User user;

  AuthLoggedIn({required this.user});

  @override
  List<Object> get props => [user];
}

class AuthLoggedOut extends AuthState {}

class AuthError extends AuthState {
  final FirebaseAuthException error;

  AuthError({required this.error});
  @override
  List<Object> get props => [error];
}
