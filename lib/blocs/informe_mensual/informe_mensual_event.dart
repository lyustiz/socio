part of 'informe_mensual_bloc.dart';

abstract class InformeMensualEvent extends Equatable {
  const InformeMensualEvent();

  @override
  List<Object> get props => [];
}

class GetInformeMensual extends InformeMensualEvent {
  final int anio;
  final int mes;

  const GetInformeMensual(this.anio, this.mes);

  @override
  List<Object> get props => [anio, mes];

  @override
  String toString() => 'GetInformeMensual idJuego $anio $mes ';
}

class SelectInformeMensual extends InformeMensualEvent {
  final InformeMensualDto informeJuego;

  const SelectInformeMensual(this.informeJuego);

  @override
  List<Object> get props => [informeJuego];

  @override
  String toString() => 'SelectInformeMensual';
}
