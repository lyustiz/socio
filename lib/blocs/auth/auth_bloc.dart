import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:socio/providers/result.dart';
import 'package:socio/repository/auth_repository.dart';
import 'package:socio/repository/sincronizar_repository.dart';
import 'package:socio/utils/db/db_manager.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  SincronizarRepository syncRep = SincronizarRepository();
  AuthRepository authRep = AuthRepository();

  AuthBloc() : super(const AuthInitial()) {
    on<AuthLogin>((event, emit) => _onLogin(event, emit));
    on<AuthLogout>((event, emit) => _onLogout(event, emit));
  }

  void _onLogin(event, emit) async {
    emit(const AuthLoading(message: 'autenticando usuario ...'));

    Result login =
        const Result(isOk: false, isLogged: false, isSync: false, message: '');

    if (event.celular == null || event.password == null) {
      emit(const AuthError(error: 'Celular o Password invalido'));
    }

    try {
      login =
          await authRep.login(celular: event.celular, password: event.password);
    } catch (errorMessage) {
      emit(AuthError(error: errorMessage.toString()));
    }

    if ((login.isLogged) & (!login.isSync)) {
      try {} catch (errorMessage) {
        emit(AuthError(error: errorMessage.toString()));
      }
    }

    if (login.isLogged) {
      emit(AuthLogged(usuario: login.usuario!));
    } else {
      if (state is AuthLoading) {
        if (!login.isOk) {
          emit(AuthError(error: login.message ?? 'Error Login'));
        } else {
          emit(const AuthError(error: 'Usuario o Contraseña Invalidos'));
        }
      }
    }
  }

  void _onLogout(event, emit) async {
    emit(const Logout());
  }
}
