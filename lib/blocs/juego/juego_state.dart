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

  const JuegoLoaded(this.juego);

  @override
  List<Object> get props => [juego];

  @override
  String toString() => 'JuegoLoaded { juegos: $juego }';
}

class JuegosLoaded extends JuegoState {
  final List<JuegosWithConfiguracion> juegos;

  const JuegosLoaded(this.juegos);

  @override
  List<Object> get props => [juegos];

  @override
  String toString() => 'JuegosLoaded { juegos: $juegos }';
}

class JuegoSelected extends JuegoState {
  final JuegosWithConfiguracion juego;

  const JuegoSelected(this.juego);
  @override
  String toString() => 'JuegoSelected $juego';
}

class JuegoExito extends JuegoState {
  final String mensaje;
  const JuegoExito(this.mensaje);

  @override
  List<Object> get props => [mensaje];

  @override
  String toString() => 'FiguraExito $mensaje';
}

class JuegoError extends JuegoState {
  final String mensaje;
  const JuegoError(this.mensaje);

  @override
  List<Object> get props => [mensaje];

  @override
  String toString() => 'JuegoError $mensaje';
}
