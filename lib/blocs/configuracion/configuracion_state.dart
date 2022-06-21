part of 'configuracion_bloc.dart';

abstract class ConfiguracionState extends Equatable {
  const ConfiguracionState();

  @override
  List<Object> get props => [];
}

class ConfiguracionInitial extends ConfiguracionState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'ConfiguracionInitial { $props }';
}

class ConfiguracionLoading extends ConfiguracionState {
  @override
  String toString() => 'ConfiguracionLoading { configuracions: [] }';
}

class ConfiguracionesLoaded extends ConfiguracionState {
  final List<Configuracion> configuraciones;

  ConfiguracionesLoaded(this.configuraciones);

  @override
  List<Object> get props => [configuraciones];

  @override
  String toString() =>
      'ConfiguracionLoaded { configuraciones: $configuraciones }';
}

class ConfiguracionLoaded extends ConfiguracionState {
  final Configuracion configuracion;

  const ConfiguracionLoaded(this.configuracion);

  @override
  List<Object> get props => [configuracion];

  @override
  String toString() => 'ConfiguracionLoaded { configuracions: $configuracion }';
}

class ConfiguracionSelected extends ConfiguracionState {
  final Configuracion configuracion;

  ConfiguracionSelected(this.configuracion);

  @override
  List<Object> get props => [configuracion];

  @override
  String toString() => 'ConfiguracionSelected $configuracion';
}

class ConfiguracionError extends ConfiguracionState {
  final String mensaje;
  ConfiguracionError(this.mensaje);

  @override
  List<Object> get props => [mensaje];

  @override
  String toString() => 'ConfiguracionError $mensaje';
}

class ConfiguracionExito extends ConfiguracionState {
  final String mensaje;
  final int idConfiguracion;
  ConfiguracionExito(this.mensaje, this.idConfiguracion);

  @override
  List<Object> get props => [mensaje, idConfiguracion];

  @override
  String toString() => 'ConfiguracionExisto $mensaje';
}
