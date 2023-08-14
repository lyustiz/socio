part of 'yapa_bloc.dart';

abstract class YapaState extends Equatable {
  const YapaState();

  @override
  List<Object> get props => [];
}

class YapaInitial extends YapaState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'YapaInitial { $props }';
}

class YapaLoading extends YapaState {
  @override
  String toString() => 'YapaLoading { $props }';
}

class YapasLoaded extends YapaState {
  final List<YapaDto> yapas;

  const YapasLoaded(this.yapas);

  @override
  List<Object> get props => [yapas];

  @override
  String toString() => 'YapasLoaded { yapas: $yapas }';
}

class YapaSelected extends YapaState {
  final YapaDto yapa;

  const YapaSelected(this.yapa);

  @override
  List<Object> get props => [yapa];

  @override
  String toString() => 'YapaSelected $yapa';
}

class YapaError extends YapaState {
  final String mensaje;
  const YapaError(this.mensaje);

  @override
  List<Object> get props => [mensaje];

  @override
  String toString() => 'YapaError $mensaje';
}

class YapaExito extends YapaState {
  final String mensaje;
  const YapaExito(this.mensaje);

  @override
  List<Object> get props => [mensaje];

  @override
  String toString() => 'YapaExito $mensaje';
}
