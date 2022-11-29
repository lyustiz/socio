part of 'auditoria_acumulado_bloc.dart';

abstract class AuditoriaAcumuladoState extends Equatable {
  const AuditoriaAcumuladoState();

  @override
  List<Object> get props => [];
}

class AuditoriaAcumuladoInitial extends AuditoriaAcumuladoState {
  @override
  String toString() => 'AuditoriaAcumuladoInitial { juegos: [] }';
}

class AuditoriaAcumuladoLoading extends AuditoriaAcumuladoState {
  @override
  String toString() => 'JuegodetalleLoading { juegos: [] }';
}

class AuditoriaAcumuladoLoaded extends AuditoriaAcumuladoState {
  final List<AuditoriaAcumuladoDto> auditoria;

  const AuditoriaAcumuladoLoaded(this.auditoria);

  @override
  List<Object> get props => [auditoria];

  @override
  String toString() => 'AuditoriaAcumuladoLoaded { auditoria: $auditoria }';
}

class AuditoriaAcumuladoSelected extends AuditoriaAcumuladoState {
  final AuditoriaAcumuladoDto auditoria;

  const AuditoriaAcumuladoSelected(this.auditoria);
  @override
  String toString() => 'AuditoriaAcumuladoSelected $auditoria';
}

class AuditoriaAcumuladoError extends AuditoriaAcumuladoState {
  final String errorMsj;
  const AuditoriaAcumuladoError(this.errorMsj);
  @override
  List<Object> get props => [errorMsj];
  @override
  String toString() => 'AuditoriaAcumuladoError';
}
