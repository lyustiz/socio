part of 'juego_bloc.dart';

abstract class JuegoState extends Equatable {
  const JuegoState();

  @override
  List<Object> get props => [];
}

class JuegoInitial extends JuegoState {
  @override
  String toString() => 'JuegoInitial { juegos: [] }';
}

class JuegoLoading extends JuegoState {
  @override
  String toString() => 'JuegoLoading { juegos: [] }';
}

class JuegoLoaded extends JuegoState {
  final JuegosWithConfiguracion juego;

  JuegoLoaded(juego) : this.juego = juego;

  @override
  List<Object> get props => [juego];

  @override
  String toString() => 'JuegoLoaded { juegos: $juego }';
}

class JuegosLoaded extends JuegoState {
  final List<JuegosWithConfiguracion> juegos;

  JuegosLoaded(List<JuegosWithConfiguracion> juegos) : this.juegos = juegos;

  @override
  List<Object> get props => [juegos];

  @override
  String toString() => 'JuegosLoaded { juegos: $juegos }';
}

class JuegoSelected extends JuegoState {
  final JuegosWithConfiguracion juego;

  JuegoSelected(JuegosWithConfiguracion juego) : this.juego = juego;
  @override
  String toString() => 'JuegoSelected $juego';
}

class JuegoError extends JuegoState {
  @override
  String toString() => 'JuegoError';
}
