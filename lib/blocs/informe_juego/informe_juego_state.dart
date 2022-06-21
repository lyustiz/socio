part of 'informe_juego_bloc.dart';

abstract class InformeJuegoState extends Equatable {
  const InformeJuegoState();

  @override
  List<Object> get props => [];
}

class InformeJuegoInitial extends InformeJuegoState {
  @override
  String toString() => 'InformeJuegoInitial { juegos: [] }';
}

class InformeJuegoLoading extends InformeJuegoState {
  @override
  String toString() => 'JuegodetalleLoading { juegos: [] }';
}

class InformeJuegoLoaded extends InformeJuegoState {
  final InformeJuegoDto informeJuego;

  const InformeJuegoLoaded(this.informeJuego);

  @override
  List<Object> get props => [informeJuego];

  @override
  String toString() => 'JuegoLoaded { informe: $informeJuego }';
}

class InformeJuegoSelected extends InformeJuegoState {
  final InformeJuegoDto informeJuego;

  const InformeJuegoSelected(this.informeJuego);
  @override
  String toString() => 'JuegoSelected $informeJuego';
}

class InformeJuegoError extends InformeJuegoState {
  @override
  String toString() => 'InformeJuegoError';
}
