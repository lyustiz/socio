part of 'informe_venta_bloc.dart';

abstract class InformeVentaState extends Equatable {
  const InformeVentaState();

  @override
  List<Object> get props => [];
}

class InformeVentaInitial extends InformeVentaState {
  @override
  String toString() => 'InformeVentaInitial { juegos: [] }';
}

class InformeVentaLoading extends InformeVentaState {
  @override
  String toString() => 'JuegodetalleLoading { juegos: [] }';
}

class InformeVentaLoaded extends InformeVentaState {
  final InformePromedioVentasDto informe;

  const InformeVentaLoaded(this.informe);

  @override
  List<Object> get props => [informe];

  @override
  String toString() => 'InformeVentaLoaded { informe: $informe }';
}

class InformeVentaSelected extends InformeVentaState {
  final InformePromedioVentasDto informe;

  const InformeVentaSelected(this.informe);
  @override
  String toString() => 'InformeVentaSelected $informe';
}

class InformeVentaError extends InformeVentaState {
  final String errorMsj;
  const InformeVentaError(this.errorMsj);
  @override
  List<Object> get props => [errorMsj];
  @override
  String toString() => 'InformeVentaError';
}
