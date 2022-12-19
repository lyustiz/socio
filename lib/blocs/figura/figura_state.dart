part of 'figura_bloc.dart';

abstract class FiguraState extends Equatable {
  const FiguraState();

  @override
  List<Object> get props => [];
}

class FiguraInitial extends FiguraState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'FiguraInitial { $props }';
}

class FiguraLoading extends FiguraState {
  @override
  String toString() => 'FiguraLoading { configuracions: [] }';
}

class FigurasLoaded extends FiguraState {
  final List<FiguraDto> figuras;

  const FigurasLoaded(this.figuras);

  @override
  List<Object> get props => [figuras];

  @override
  String toString() => 'FiguraLoaded { figuras: $figuras }';
}

class FiguraLoaded extends FiguraState {
  final FiguraDto figuras;

  const FiguraLoaded(this.figuras);

  @override
  List<Object> get props => [figuras];

  @override
  String toString() => 'FiguraLoaded { configuracions: $figuras }';
}

class FiguraSelected extends FiguraState {
  final Figura figuras;

  FiguraSelected(this.figuras);

  @override
  List<Object> get props => [figuras];

  @override
  String toString() => 'FiguraSelected $figuras';
}

class FiguraError extends FiguraState {
  final String mensaje;
  const FiguraError(this.mensaje);

  @override
  List<Object> get props => [mensaje];

  @override
  String toString() => 'FiguraError $mensaje';
}

class FiguraExito extends FiguraState {
  final String mensaje;
  const FiguraExito(this.mensaje);

  @override
  List<Object> get props => [mensaje];

  @override
  String toString() => 'FiguraExito $mensaje';
}
