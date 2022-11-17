part of 'informe_venta_bloc.dart';

abstract class InformeVentaEvent extends Equatable {
  const InformeVentaEvent();

  @override
  List<Object> get props => [];
}

class GetInformeVenta extends InformeVentaEvent {
  final String fechaI;
  final String fechaF;

  const GetInformeVenta(this.fechaI, this.fechaF);

  @override
  List<Object> get props => [fechaI, fechaF];

  @override
  String toString() => 'GetInformeVenta idJuego $fechaI $fechaF ';
}

class SelectInformeVenta extends InformeVentaEvent {
  final InformePromedioVentasDto informe;

  const SelectInformeVenta(this.informe);

  @override
  List<Object> get props => [informe];

  @override
  String toString() => 'SelectInformeVenta';
}
