part of 'auth_bloc.dart';

class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];

  @override
  String toString() {
    return 'AuthState';
  }
}

class AuthInitial extends AuthState {
  final bool logged = false;
  const AuthInitial();

  @override
  List<Object> get props => [logged];

  @override
  String toString() {
    return 'AuthInitial';
  }
}

class AuthLoading extends AuthState {
  final String message;
  const AuthLoading({this.message = ''});

  @override
  List<Object> get props => [message];

  @override
  String toString() {
    return 'UsuarioLoading $message';
  }
}

class Logout extends AuthState {
  final bool logged = false;
  const Logout();

  @override
  List<Object> get props => [logged];
}

class AuthLogged extends AuthState {
  final bool logged = true;
  final Usuario usuario;
  const AuthLogged({required this.usuario});

  @override
  List<Object> get props => [logged, usuario];
  @override
  String toString() {
    return 'AuthLogged  $logged';
  }
}

class AuthError extends AuthState {
  final String error;
  const AuthError({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() {
    return 'AuthError $error';
  }
}
