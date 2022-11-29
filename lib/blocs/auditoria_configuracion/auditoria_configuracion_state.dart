part of 'auditoria_configuracion_bloc.dart';

abstract class AuditoriaConfiguracionState extends Equatable {
  const AuditoriaConfiguracionState();

  @override
  List<Object> get props => [];
}

class AuditoriaConfiguracionInitial extends AuditoriaConfiguracionState {
  @override
  String toString() => 'AuditoriaConfiguracionInitial { juegos: [] }';
}

class AuditoriaConfiguracionLoading extends AuditoriaConfiguracionState {
  @override
  String toString() => 'JuegodetalleLoading { juegos: [] }';
}

class AuditoriaConfiguracionLoaded extends AuditoriaConfiguracionState {
  final List<AuditoriaConfiguracionDto> auditoria;

  const AuditoriaConfiguracionLoaded(this.auditoria);

  @override
  List<Object> get props => [auditoria];

  @override
  String toString() => 'AuditoriaConfiguracionLoaded { auditoria: $auditoria }';
}

class AuditoriaConfiguracionSelected extends AuditoriaConfiguracionState {
  final List<AuditoriaConfiguracionDto> auditoria;

  const AuditoriaConfiguracionSelected(this.auditoria);
  @override
  String toString() => 'AuditoriaConfiguracionSelected $auditoria';
}

class AuditoriaConfiguracionError extends AuditoriaConfiguracionState {
  final String errorMsj;
  const AuditoriaConfiguracionError(this.errorMsj);
  @override
  List<Object> get props => [errorMsj];
  @override
  String toString() => 'AuditoriaConfiguracionError';
}
