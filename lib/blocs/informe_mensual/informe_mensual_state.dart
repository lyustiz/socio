part of 'informe_mensual_bloc.dart';

abstract class InformeMensualState extends Equatable {
  const InformeMensualState();

  @override
  List<Object> get props => [];
}

class InformeMensualInitial extends InformeMensualState {
  @override
  String toString() => 'InformeMensualInitial { juegos: [] }';
}

class InformeMensualLoading extends InformeMensualState {
  @override
  String toString() => 'InformeMensualLoading { juegos: [] }';
}

class InformeMensualLoaded extends InformeMensualState {
  final InformeMensualDto informe;

  const InformeMensualLoaded(this.informe);

  @override
  List<Object> get props => [informe];

  @override
  String toString() => 'InformeMensualLoaded { informe: $informe }';
}

class InformeMensualSelected extends InformeMensualState {
  final InformeMensualDto informe;

  const InformeMensualSelected(this.informe);
  @override
  String toString() => 'InformeMensualSelected $informe';
}

class InformeMensualError extends InformeMensualState {
  final String errorMsj;
  const InformeMensualError(this.errorMsj);
  @override
  List<Object> get props => [errorMsj];
  @override
  String toString() => 'InformeMensualError';
}
