part of 'configuracion_dto_bloc.dart';

abstract class ConfiguracionDtoState extends Equatable {
  ConfiguracionDtoState();

  @override
  List<Object> get props => [];
}

class ConfiguracionDtoInitial extends ConfiguracionDtoState {
  @override
  String toString() => 'ConfiguracionDtoInitial';
}

class ConfiguracionDtoLoading extends ConfiguracionDtoState {
  @override
  String toString() => 'ConfiguracionDtoLoading';
}

class ConfiguracionDtoLoaded extends ConfiguracionDtoState {
  final ConfiguracionDto configuracionDto;

  ConfiguracionDtoLoaded(this.configuracionDto);

  @override
  List<Object> get props => [configuracionDto];

  @override
  String toString() => 'JuegoLoaded { informe: $configuracionDto }';
}

class ConfiguracionDtoSelected extends ConfiguracionDtoState {
  final ConfiguracionDto configuracionDto;

  ConfiguracionDtoSelected(this.configuracionDto);
  @override
  String toString() => 'ConfiguracionDtoSelected $configuracionDto';
}

class ConfiguracionDtoError extends ConfiguracionDtoState {
  final String errorMsj;
  ConfiguracionDtoError(this.errorMsj);
  @override
  List<Object> get props => [errorMsj];
  @override
  String toString() => 'ConfiguracionDtoError';
}
