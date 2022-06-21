part of 'juegodetalle_bloc.dart';

abstract class JuegoDetalleEvent extends Equatable {
  const JuegoDetalleEvent();

  @override
  List<Object> get props => [];
}

class GetJuegoDetalle extends JuegoDetalleEvent {
  final int idJuego;

  const GetJuegoDetalle(this.idJuego);

  @override
  List<Object> get props => [idJuego];

  @override
  String toString() => 'GetJuegoDetalle  idJuego $idJuego ';
}

class SelectJuegoDetalle extends JuegoDetalleEvent {
  final JuegosWithDetalles juegosWithDetalles;

  const SelectJuegoDetalle(this.juegosWithDetalles);

  @override
  List<Object> get props => [juegosWithDetalles];

  @override
  String toString() => 'SelectJuegoDetalle';
}
