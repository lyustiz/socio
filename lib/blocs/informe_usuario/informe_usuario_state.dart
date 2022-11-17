part of 'informe_usuario_bloc.dart';

abstract class InformeUsuarioState extends Equatable {
  const InformeUsuarioState();

  @override
  List<Object> get props => [];
}

class InformeUsuarioInitial extends InformeUsuarioState {
  @override
  String toString() => 'InformeUsuarioInitial { juegos: [] }';
}

class InformeUsuarioLoading extends InformeUsuarioState {
  @override
  String toString() => 'JuegodetalleLoading { juegos: [] }';
}

class InformeUsuarioLoaded extends InformeUsuarioState {
  final InformeCajaUsuarioDto informe;

  const InformeUsuarioLoaded(this.informe);

  @override
  List<Object> get props => [informe];

  @override
  String toString() => 'InformeUsuarioLoaded { informe: $informe }';
}

class InformeUsuarioSelected extends InformeUsuarioState {
  final InformeCajaUsuarioDto informe;

  const InformeUsuarioSelected(this.informe);
  @override
  String toString() => 'InformeUsuarioSelected $informe';
}

class InformeUsuarioError extends InformeUsuarioState {
  final String errorMsj;
  const InformeUsuarioError(this.errorMsj);
  @override
  List<Object> get props => [errorMsj];
  @override
  String toString() => 'InformeUsuarioError';
}
