part of 'estadistica_bloc.dart';

abstract class EstadisticaEvent extends Equatable {
  const EstadisticaEvent();

  @override
  List<Object> get props => [];
}

class GetEstadistica extends EstadisticaEvent {
  final int idJuego;

  GetEstadistica(this.idJuego);

  @override
  List<Object> get props => [idJuego];

  @override
  String toString() => 'GetEstadistica';
}
