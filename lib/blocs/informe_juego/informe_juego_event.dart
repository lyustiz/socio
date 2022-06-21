part of 'informe_juego_bloc.dart';

abstract class InformeJuegoEvent extends Equatable {
  const InformeJuegoEvent();

  @override
  List<Object> get props => [];
}

class GetInformeJuego extends InformeJuegoEvent {
  final int idJuego;

  const GetInformeJuego(this.idJuego);

  @override
  List<Object> get props => [idJuego];

  @override
  String toString() => 'GetJuegoDetalle idJuego $idJuego ';
}

class SelectJuegoDetalle extends InformeJuegoEvent {
  final InformeJuegoDto informeJuego;

  const SelectJuegoDetalle(this.informeJuego);

  @override
  List<Object> get props => [informeJuego];

  @override
  String toString() => 'SelectJuegoDetalle';
}
