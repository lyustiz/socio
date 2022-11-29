part of 'configuracion_bloc.dart';

abstract class ConfiguracionEvent extends Equatable {
  const ConfiguracionEvent();

  @override
  List<Object> get props => [];
}

class GetConfiguracion extends ConfiguracionEvent {
  final Configuracion configuracion;

  GetConfiguracion(this.configuracion);

  @override
  List<Object> get props => [configuracion];

  @override
  String toString() => 'GetConfiguracion';
}

class SetConfiguracion extends ConfiguracionEvent {
  final Configuracion configuracion;

  SetConfiguracion(this.configuracion);

  @override
  List<Object> get props => [configuracion];

  @override
  String toString() => 'GetConfiguracion';
}

class GetAllConfiguracion extends ConfiguracionEvent {
  final String terminado;
  GetAllConfiguracion(this.terminado);

  @override
  List<Object> get props => [terminado];

  @override
  String toString() => 'GetAllUsuario';
}

class UpdateConfiguracion extends ConfiguracionEvent {
  final Configuracion configuracion;

  UpdateConfiguracion(this.configuracion);

  @override
  List<Object> get props => [configuracion];

  @override
  String toString() => 'UpdateConfiguracion';
}

class InsertConfiguracion extends ConfiguracionEvent {
  final Configuracion configuracion;

  InsertConfiguracion(this.configuracion);

  @override
  List<Object> get props => [configuracion];

  @override
  String toString() => 'InsertConfiguracion';
}

class DeleteConfiguracion extends ConfiguracionEvent {
  final Configuracion configuracion;

  DeleteConfiguracion(this.configuracion);

  @override
  List<Object> get props => [configuracion];

  @override
  String toString() => 'DeleteConfiguracion';
}

class SelectConfiguracion extends ConfiguracionEvent {
  final Configuracion configuracion;

  SelectConfiguracion(this.configuracion);

  @override
  List<Object> get props => [configuracion];

  @override
  String toString() => 'SelectConfiguracion';
}
